Kubernetes Cluster
143.110.187.25
139.59.1.145
64.227.164.155

************************************************
PHASE 1: Run on ALL Machines (Master & Workers)
************************************************

1) Update & Install Basic Tools:
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg gnupg2 software-properties-common

2) Disable Swap (Critical)
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab

3) Load Kernel Modules (Required for container networking.)
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter


4) Configure Sysctl Networking (Required for pods to communicate.)
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system


5) Install Container Runtime (Containerd)
# Add Docker's official GPG key and repo (Containerd comes from here)
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install containerd
sudo apt update
sudo apt install -y containerd.io

# Configure containerd to use SystemdCgroup (CRITICAL STEP)
containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml

# Restart containerd
sudo systemctl restart containerd
sudo systemctl enable containerd

6) Install Kubernetes Components (v1.30)
# Add Kubernetes GPG Key
sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Add Kubernetes Repository
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Install Tools
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo systemctl enable --now kubelet

************************************************
PHASE 2: Run on MASTER Node Only
************************************************

# Replace <MASTER_IP> with your master node's private IP (e.g., 172.31.x.x or 10.x.x.x)
sudo kubeadm init --apiserver-advertise-address=<MASTER_IP> --pod-network-cidr=192.168.0.0/16

Example: kubeadm init --apiserver-advertise-address=10.122.0.9 --pod-network-cidr=192.168.0.0/16


By running this command you will get following set of commands 

Set up local kubeconfig
Run this as your normal user (exit root if needed).
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

You will also get a token to run on your worker machines. Save that second command for later and execute that on worker nodes to join the master

kubeadm join 172.31.81.24:6443 --token xoq8rf.rsmij5a41jo349jp \
    --discovery-token-ca-cert-hash sha256:367de9ffbdba10f633ff5594e62afc3186bb1b350b05e7f411d18e4f8e2810ad

Check the status of all the system related pods:
kubectl get pods -o wide --all-namespaces

Install Pod Network (Calico):
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/calico.yaml

To remove the node from cluster:-
------------------------------
kubectl drain <node-name> --ignore-daemonsets --delete-emptydir-data
kubectl delete node worker2

If node not works run the below commands in client nodes and work:

kubeadm reset -f
rm -rf /etc/kubernetes/*
systemctl restart kubelet
sudo rm -rf /etc/cni/net.d
sudo systemctl restart kubelet
sudo systemctl restart containerd

sudo journalctl -u kubelet -f


Check the status of all the system related pods post calico command:

kubectl get pods -o wide --all-namespaces

After few seconds run following command(This shows you how many nodes you have in your cluster):

kubectl get nodes

Generate Join Command (If you missed it):
kubeadm token create --print-join-command

***************************************************
PHASE 3: Run on WORKER Nodes Only. Join the Cluster
***************************************************
Paste the command generated in step 4 of Phase 2. It looks like this:

sudo kubeadm join <MASTER_IP>:6443 --token <TOKEN> --discovery-token-ca-cert-hash sha256:<HASH>

PHASE 4: Verification (On Master)

kubectl get nodes  (Wait a few minutes. Status should change from NotReady to Ready for all worker nodes once Calico starts up.)

kubectl get pods -A


To delete full clusterinfo:-
--------------------------


✅ 1. Stop Kubernetes Services
sudo systemctl stop kubelet
sudo systemctl stop containerd

✅ 2. Remove Kubernetes Packages

This removes kubeadm, kubelet, kubectl completely:

sudo apt-get purge -y kubeadm kubelet kubectl
sudo apt-get autoremove -y


If packages were “held”, remove hold first:

sudo apt-mark unhold kubeadm kubelet kubectl


Now purge again if needed.

✅ 3. Remove Containerd Completely
Stop containerd
sudo systemctl stop containerd

Remove containerd package
sudo apt-get purge -y containerd
sudo apt-get autoremove -y

✅ 4. Delete All Kubernetes Configuration Files

These folders contain kubelet config, certificates, kubeadm state, etc.

sudo rm -rf /etc/kubernetes/
sudo rm -rf /var/lib/kubelet/
sudo rm -rf /var/lib/etcd/
sudo rm -rf /var/lib/kubeadm/
sudo rm -rf /var/lib/containerd/
sudo rm -rf /opt/cni/
sudo rm -rf /etc/cni/
sudo rm -rf /var/run/containerd/
sudo rm -rf /var/log/pods/
sudo rm -rf /var/log/containers/
sudo rm -rf ~/.kube

✅ 5. Disable & Remove kubelet Service

Sometimes kubelet still shows because the service file exists.

sudo systemctl disable kubelet
sudo rm -f /etc/systemd/system/kubelet.service
sudo rm -rf /usr/lib/systemd/system/kubelet.service.d/
sudo systemctl daemon-reload

✅ 6. Clean iptables & networking

Kubernetes creates bridges, iptables, and cni rules.

sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X


Restart networking:

sudo systemctl restart network-manager


(If using a cloud VM, networking service name may differ)

✅ 7. Verify everything is removed
kubeadm version
kubelet --version
kubectl version
systemctl status kubelet

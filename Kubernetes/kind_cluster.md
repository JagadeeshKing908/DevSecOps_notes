# Install and configure kind cluster

``` bash

# Install Docker

apt update -y

apt install docker.io -y

# vim kind-config.yaml

kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4

nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30080
    hostPort: 80
  - containerPort: 30443
    hostPort: 443

# To create cluster

kind create cluster --config kind-config.yaml

 ```
2. To use it from browser.
   a. Firstly change the type of service in service.yaml files.
   b. Run port forward command.

## Port Forwarding

kubectl port-forward creates a temporary tunnel between your local machine and a Kubernetes Pod/Service.
It allows you to access applications that are not exposed externally.

   
```bash

kubectl port-forward <resource> <local-port>:<remote-port> -n <namespace>

kubectl port-forward  svc/monitoring-grafana 3000:80 -n monitoring --address 0.0.0.0


VM Port 3000
        |
        |
        ▼
Service Port 80

LOCAL MACHINE PORT : KUBERNETES PORT

svc = Service
monitoring-grafana = Service name

http://VM-IP:3000

Browser: --> http://VM-IP:3000

goes to:---> Grafana Service :80

```
## kubectl Patch

kubectl patch modifies an existing Kubernetes object without editing the complete YAML file.

```bash
kubectl patch <resource> <name> -n <namespace> -p '<patch>'

kubectl patch svc monitoring-grafana \
-n monitoring \
-p '{"spec":{"type":"NodePort"}}'

```
Here -p --> means patch content






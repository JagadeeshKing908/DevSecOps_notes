

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






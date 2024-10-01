# workspace kube

Kubernetes installation and configuration

## Usage

```bash
workspace kube COMMAND
```

## Examples

```bash
workspace kube install k3s -y // Install k3s in automatic mode
```

```bash
workspace kube install minikube // Install minikube, interactive mode
```

```bash
workspace kube show-config // Show kubernetes configuration file
```

## Commands

- [install](workspace%20kube%20install) - Install single node kubernetes cluster
- [show-config](workspace%20kube%20show-config) - Show kubernetes configuration file
- [apply-k3s-config](workspace%20kube%20apply-k3s-config) - Replacing ~/.kube/config file by k3s configuration file



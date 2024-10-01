# workspace kube install

Install single node kubernetes cluster

## Usage

```bash
workspace kube install DISTRO [OPTIONS]
```

## Arguments

#### *DISTRO*

Kubernetes distribution to be installed.  


| Attributes      | &nbsp;
|-----------------|-------------
| Required:       | ✓ Yes
| Allowed Values: | k3s, minikube

## Options

#### *--yes, -y*

Automatic mode, does not require interactive input. Applicable only to install option. Useful for CI/CD environments and automation scripts.



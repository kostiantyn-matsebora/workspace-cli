# workspace install

Install applications and tools required for workspace. Does not require interactive input, so this command cannot be used in CI/CD environments and automation scripts.  


| Attributes       | &nbsp;
|------------------|-------------
| Alias:           | i

## Usage

```bash
workspace install APPLICATION [OPTIONS]
```

## Arguments

#### *APPLICATION*

Application or toolkit needs to be installed.  


| Attributes      | &nbsp;
|-----------------|-------------
| Required:       | ✓ Yes
| Allowed Values: | all, git, docker, k3s, minikube, kube-tools, vscode, vals

## Options

#### *--yes, -y*

Automatic mode, does not require interactive input. Useful for CI/CD environments and automation scripts.



# workspace

CLI that provides functionality for installing and configuring workspace for a software engineer/DevOps.

| Attributes       | &nbsp;
|------------------|-------------
| Version:         | 0.5.0

## Usage

```bash
workspace COMMAND
```

## Commands

- [install](workspace%20install) - Install applications and tools required for workspace. Does not require interactive input, so this command cannot be used in CI/CD environments and automation scripts.
- [setup](workspace%20setup) - Setup (install and configure) workspace. Require interactive input, so this command cannot be used in CI/CD environments and automation scripts.
- [config](workspace%20config) - Configure workspace. Applications needs to be already installed. Some of steps require interactive input, so this command cannot be used in CI/CD environments and automation scripts.
- [git](workspace%20git) - Install and configure git toolkit
- [docker](workspace%20docker) - Install rootless docker
- [howdy](workspace%20howdy) - Install and configure pluggable authentication module (PAM) howdy for facial recognition
- [kube](workspace%20kube) - Kubernetes installation and configuration
- [kube-tools](workspace%20kube-tools) - Kubernetes CLI tools installation and configuration
- [vscode](workspace%20vscode) - Visual Studio Code installation and configuration
- [vals](workspace%20vals) - Install and configure vals
- [system](workspace%20system) - System maintenance utilities

# ISSUE TRACKER

Report issues at \<https://github.com/kostiantyn-matsebora/workspace-cli\>

# LICENSE
[MIT License](https://github.com/kostiantyn-matsebora/workspace-cli/blob/master/LICENSE)

# Workspace CLI

Workspace CLI is a bash script that provides functionality for installing and configuring workspace for a software engineer/DevOps working with containers and orchestration  on a Linux environment.

Functionality includes installation and configuration of the following applications:


- [Git](https://git-scm.com/) and [Github CLI](https://cli.github.com/).
- [Visual Studio Code](https://code.visualstudio.com/).
- Rootless [docker]( https://rootlesscontaine.rs/getting-started/docker/).
- Single node kubernetes: [k3s](https://k3s.io/) or [minikube](https://minikube.sigs.k8s.io/docs/).
- Kubernetes CLI tools like: [kubectl](https://kubernetes.io/docs/reference/kubectl/), [helm](https://helm.sh/), [helmfile](https://github.com/helmfile/helmfile), [vals](https://github.com/helmfile/vals).

Workspace CLI is designed to be used on a Linux environment, and it is tested on Ubuntu 22.04 LTS.

## Installation

To install workspace CLI you simply must do the following steps:

- Download workspace script the destination directory, for instance `$HOME/bin`: 

  ```Bash
    mkdir -p $HOME/bin
    wget https://raw.githubusercontent.com/kostiantyn-matsebora/workspace-cli/master/release/workspace -O $HOME/bin/workspace
    chmod +x $HOME/bin/workspace
  ```

- Add an alias to your `.bashrc` or `.bash_profile` file:

  ```Bash
  echo "alias workspace='$HOME/bin/workspace'" >> $HOME/.bashrc
  ```

- Reload your shell:

  ```Bash
  source $HOME/.bashrc
  ```

# Usage

After installation, you can use workspace CLI by running `workspace` command in your terminal. It will show you a help message with available commands.

```shell
$ workspace

workspace - CLI that provides functionality for installing and configuring workspace for a software engineer/DevOps.

Usage:
  workspace COMMAND
  workspace [COMMAND] --help | -h
  workspace --version | -v

Commands:
  completions             Generate bash completions
  register-autocomplete   Register autocompletion for workspace CLI in .bashrc file
  upgrade                 Upgrade workspace CLI to latest version
  git                     Install and configure git toolkit
  docker                  Install docker
  howdy                   Install and configure pluggable authentication module (PAM) howdy for facial recognition
  minikube                minikube installation and configuration
  kube-tools              Kubernetes CLI tools installation and configuration
  vscode                  Visual Studio Code installation and configuration
  vals                    Install and configure vals
  system                  System maintenance utilities
```

To get help for specific commands you can run: `workspace COMMAND --help`, for instance:

```shell
$ workspace git --help

workspace git - Install and configure git toolkit

Usage:
  workspace git COMMAND
  workspace git [COMMAND] --help | -h

Setup Commands:
  setup     Install and configure git toolkit

Install Commands:
  install   Install git toolkit

Configuration Commands:
  config    Configure git toolkit

Options:
  --help, -h
    Show this help

Examples:
  workspace git setup // Install and configure git toolkit
  workspace git install -y // Install git toolkit, automatic mode
  workspace git config // Configure git toolkit
```

As an example to install and configure `git` and `GitHub CLI` you can run the following command:

```shell
 workspace setup git
```

To install and configure all applications you can run:

```shell
 workspace setup all
```

## Development

CLI is generated using  [bashly](https://bashly.dannyb.co/), a bash framework for writing CLI applications.

Bashly configuration and sources are located in `bashly` directory.

If you have already installed bashly you can regenerate CLI by running the following command from the destination directory:

```shell
 bashly generate
```

or if you already have docker installed you can add the following alias to your `.bashrc` or `.bash_profile` file:

```shell
alias bashly='docker run -it --rm -v $HOME/bin/workspace -w /work dannyben/bashly'
```

and then use bashly command as usual:

```shell
bashly generate
```

For more information how to install bashly you can visit [bashly](https://bashly.dannyb.co/) website.

## Contributing

If you experience any issues, have a question or a suggestion, or if you wish
to contribute, feel free to [open an issue][issues] or
[start a discussion][discussions].

[issues]: https://github.com/kostiantyn-matsebora/workspace-cli/issues
[discussions]: https://github.com/kostiantyn-matsebora/workspace-cli/discussions

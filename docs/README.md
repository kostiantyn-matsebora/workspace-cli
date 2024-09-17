# Workspace CLI

Workspace CLI is a bash script that provides functionality for installing and configuring workspace for a software engineer/DevOps working with containers and orchestration  on a Linux environment.

Functionality includes installation and configuration of the following applications:


- [Git](https://git-scm.com/) and [Github CLI](https://cli.github.com/).
- [Visual Studio Code](https://code.visualstudio.com/).
- Rootless [docker]( https://rootlesscontaine.rs/getting-started/docker/).
- Single node kubernetes: [k3s](https://k3s.io/) or [minikube](https://minikube.sigs.k8s.io/docs/).
- Kubernetes CLI tools like: [kubectl](https://kubernetes.io/docs/reference/kubectl/), [helm](https://helm.sh/), [helmfile](https://github.com/helmfile/helmfile), [vals](https://github.com/helmfile/vals).

## Installation

To install workspace CLI you simply must do the following steps:

- Download workspace script the destination directory, for instance `$HOME/bin`: 

  ```Bash
    mkdir -p $HOME/bin
    wget https://raw.githubusercontent.com/kostiantyn-matsebora/workspace-cli/master/release/workspace -O $HOME/bin
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

```Bash
$ workspace
workspace - Workspace cli

Usage:
  workspace COMMAND
  workspace [COMMAND] --help | -h
  workspace --version | -v

Commands:
  setup     Setup (install and configure) workspace. Some of steps require interactive input, so this command cannot be used in CI/CD environments and automation scripts.
  config    Configure workspace. Applications needs to be already installed. Some of steps require interactive input, so this command cannot be used in CI/CD environments and automation scripts.
  install   Install applications and tools required for workspace. Does not require interactive input, so this command cannot be used in CI/CD environments and automation scripts.
```

To get help for specific commands you can run `workspace COMMAND --help`, for instance:

```Bash
$ workspace setup --help
workspace setup

  Setup (install and configure) workspace. Some of the steps require interactive
  input, so this command cannot be used in CI/CD environments and automation
  scripts.

Alias: s

Usage:
  workspace setup [APPLICATION]
  workspace setup --help | -h

Options:
  --help, -h
    Show this help

Arguments:
  APPLICATION
    An application  or toolkit needs to be set up. Possible values: all, git,
    docker, k3s, minikube, kube-tools, vscode, vals

Examples:
  workspace setup git // Install and configure git
  workspace setup all // Install and configure all applications
```

As an example to install and configure `git` and `GitHub CLI` you can run the following command:

```Bash
$ workspace setup git
```

To install and configure all applications you can run:

```Bash
$ workspace setup all
```


## Development

CLI is generated using  [bashly](https://bashly.dannyb.co/), a bash framework for writing CLI applications.

Bashly configuration and sources are located in `bashly` directory.

If you have already installed bashly you can regenerate CLI by running the following command from the destination directory:

```Bash
$ bashly generate
```
or if you already have docker installed you can add the following alias to your `.bashrc` or `.bash_profile` file:

```Bash
alias bashly='docker run -it --rm -v $HOME/bin/workspace -w /work dannyben/bashly'
```
and then use bashly command as usual:

```Bash
$ bashly generate
```
For more information how to install bashly you can visit [bashly](https://bashly.dannyb.co/) website.


## Contributing

If you experience any issues, have a question or a suggestion, or if you wish
to contribute, feel free to [open an issue][issues] or
[start a discussion][discussions].


[issues]: https://github.com/kostiantyn-matsebora/workspace-cli/issues
[discussions]: https://github.com/kostiantyn-matsebora/workspace-cli/discussions

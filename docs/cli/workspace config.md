# workspace config

Configure workspace. Applications needs to be already installed. Some of steps require interactive input, so this command cannot be used in CI/CD environments and automation scripts.

| Attributes       | &nbsp;
|------------------|-------------
| Alias:           | c

## Usage

```bash
workspace config [APPLICATION]
```

## Examples

```bash
workspace config git // Configure git toolkit
```

```bash
workspace config all // Configure all applications
```

## Arguments

#### *APPLICATION*

Application or toolkit needs to be configured.  


| Attributes      | &nbsp;
|-----------------|-------------
| Allowed Values: | all, git, kubeconfig, vals



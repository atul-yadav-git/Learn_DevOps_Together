# Terraform Installation

### Official HashiCorp Installation Link : [Official Terraform Installation Link](https://developer.hashicorp.com/terraform/install#linux)

---
These steps are tailored for CentOS Stream 8, where `dnf` is the default and recommended package manager.

### Install dnf config-manager
```bash
sudo dnf install -y dnf-plugins-core
```
### Add HashiCorp Linux Repository
Use dnf config-manager to add the official HashiCorp Linux repository.

```bash
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```
### Install Terraform
```bash
sudo dnf -y install terraform
```
*Tip: Now that the HashiCorp repository is added, you can install Vault, Consul, Nomad, and Packer with the same command.*

---

## Verify the Installation
```bash
terraform -help # Usage: terraform [-version] [-help] <command> [args]
```
```
terraform -version
```

---

## Enable Tab Completion
To enable autocomplete, first ensure that a config file exists for your chosen shell.
### Bash
```bash
terraform -install-autocomplete
source ~/.bashrc
```
### Zsh
```zsh
terraform -install-autocomplete
source ~/.zshrc
```
Once autocomplete support is installed, restart your shell or source it.
```bash
source ~/.bashrc   # for Bash
source ~/.zshrc    # for Zsh
```

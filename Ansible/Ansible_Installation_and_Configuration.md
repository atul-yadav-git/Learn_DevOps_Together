# Ansible Installation and Configuration

[Official Ansible documentation](https://docs.ansible.com/ansible/latest/index.html)

## Installing pipx
To install Ansible, you first need to install pipx, which is a tool to help you install and run end-user applications written in Python in an isolated environment.

Official Documentation: [pipx Installation Documentation](https://pipx.pypa.io/stable/)

Installation Commands:
```
python3 -m pip install --user pipx
python3 -m pipx ensurepath
```
## Installing Ansible
Use pipx in your environment to install the full Ansible package, including dependencies.

Official Ansible Installation Documentation: [Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#control-node-requirements)

Ansible Installation Command:
```
pipx install --include-deps ansible
```

## Configuring argcomplete
Argcomplete is used to enable shell completion for Ansible command-line utilities. There are two ways to configure argcomplete: globally or per command.

### Global Configuration
Global completion requires bash 4.2.
```
activate-global-python-argcomplete --user
```
Source the configuration files:
```
-  For zsh: source ~/.zshenv
-  For bash: source ~/.bash_completion
```
## Checking Ansible Version
To verify that Ansible is installed correctly, check its version using the following command:
```
ansible --version
```

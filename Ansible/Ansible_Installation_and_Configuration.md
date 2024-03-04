# Ansible Installation and Configuration

```
1.  Install Ansible using the dnf package manager
2.  Using pipx (Python Environment Isolation)
3.  Using pip (Standard Python Package Manager)
```

## 1.  Using dnf Package Manager (Recommended for CentOS 8)

### Update Package List:
```
sudo dnf update
```
### Install EPEL Repository:
   
  The official Ansible repository requires Python 3.6 or later, not included in the default CentOS 8 repositories. 
  Install the Extra Packages for Enterprise Linux (EPEL) repository:
```
sudo dnf install epel-release
```

### Finally, install Ansible using the dnf package manager:
```
sudo dnf install ansible
```

### Verify the installation by checking the Ansible version:
```
ansible --version
```
### Refresh the shell environment variables:
```
source ~/.bashrc
```

*Note: `Using the package manager (dnf) ensures that Ansible and its dependencies are installed in a clean and well-managed way. It also simplifies updates and removal. Using the package manager is generally more straightforward and helps manage dependencies more effectively.`*

---

## 2.  Using pipx (Python Environment Isolation)

Install pipx:
```
python3 -m pip install --user pipx
python3 -m pipx ensurepath
```
Install Ansible: Use pipx in your environment to install the full Ansible package, including dependencies.
```
pipx install --include-deps ansible
```
Configuring argcomplete:
Argcomplete enables shell completion for Ansible command-line utilities. It can be configured globally or per command.

Global Configuration:
```
activate-global-python-argcomplete --user
```
Source the configuration files:
```
For zsh: source ~/.zshenv
For bash: source ~/.bash_completion
```

Verify that Ansible is installed correctly by checking its version:
```
ansible --version
```
---

## 3.  Using pip (Standard Python Package Manager)
Install Latest pip:  Install the latest pip directly from the Python Packaging Authority:
```
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
```
Install Ansible:   Use pip in your selected Python environment to install the full Ansible package for the current user:
```
python3 -m pip install --user ansible
```
Verify that Ansible is installed correctly by checking its version:
```
ansible --version
```
---

## To uninstall ansible

Remove Ansible from pipx:
```
pipx uninstall ansible
```
Remove using dnf Package Manager:
```
sudo dnf remove ansible
```

---

```
sudo updatedb
```

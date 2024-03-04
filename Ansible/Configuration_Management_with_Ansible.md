# Ansible Configuration Management

## Package Managers
-  Mac: Brew package manager
-  Windows: Chocolatey package manager
-  Linux: DNF/YUM/RPM package manager
-  Python Packages: Pip for installing Python packages

## Ansible Prerequisites
-  Target System: Public key of admin (master) system
-  Master System (Admin):
    -  Ansible installed
    -  passwordless authentication with the target server SSH or WINRM
-  Ansible Use Ginger2 templating

## Ansible Playbook:
YAML-based, similar to a Linux script. For running a set of tasks or commands

## Ad Hoc Commands:
Basic Single or two commands similar to Linux commands (e.g., ls, pwd)

## Inventory File
```
-  Create and populate with target server IP or FQDN
-  Default location: /etc/ansible/hosts (can be changed)
-  Example: /etc/ansible/inventory.ini
```
## Execute Ansible playbook:
```
ansible-playbook /path/to/playbook/playbookname.yml /path/to/inventory/file -v (verbosity)
```

## YAML Syntax
-  Human-readable compared to XML or JSON
-  Start and end indicators: --- (optional)
-  YAML file syntax based on a list, each item is a dictionary key-value pair
-  Indentation is crucial for hierarchy understanding

## Ansible Platform Considerations
-  Ansible is not ideal for Windows configuration management
-  Default best for Linux system configuration
-  Ansible can manage Windows hosts but should not run on them

## Modules
-  `win_command` and `win_shell`: Windows Ansible modules
-  `shell`: Linux Ansible module

## Ansible Roles:
Divide playbook into parts (templates, tasks, handlers, vars, meta, files, tests, defaults) for better reusability and organization

## Grouping in Inventory File
Group servers in the inventory file for targeted commands


## Ansible Playbook Modules
debug: Display output

register: Store command output using stdout_lines; Use register to store command output into variables for later use


## Ansible-Galaxy
Ensure ansible.windows collection is installed

Install with: `ansible-galaxy collection install ansible.windows`

Verify with: `ansible-galaxy collection list`

## Writing an Ansible Playbook

-  Start with three hyphens for YAML
-  Specify playbook name and host list (e.g., "all")
-  Choose user for execution (same/root)
-  Write tasks using hyphens for a list
-  For each task, provide a name and command/module
-  Save with YAML extension

## Example Ansible Playbook
```
---
- name: Install and Start Nginx
  hosts: all
  become: yes
  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present
    - name: Start Nginx
      service:
        name: nginx
        state: started
```
## Execute Ansible Playbook
```
ansible-playbook /path/to/playbook.yml /path/to/inventory/file -v
```
By adding verbosity (e.g., -v or -vvv), detailed information about each step is displayed during playbook execution, including SSH connection, facts gathering, and task execution.

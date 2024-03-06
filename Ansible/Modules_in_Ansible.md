# **Modules, Keywords and Parameters in Ansible**

# Modules :
```
Modules in Ansible are standalone scripts that Ansible uses to perform tasks on managed nodes. 

They are the building blocks of Ansible playbooks, responsible for carrying out specific actions on remote hosts.
```
Example (using the `file` module):
```
- name: Ensure a directory exists
  hosts: my_servers
  tasks:
    - name: Create a directory
      file:
        path: /path/to/my_directory
        state: directory
```
In this example, the file module is used to ensure that a directory (/path/to/my_directory) exists on the target hosts.

# Keywords:
```
Keywords are specific words or phrases used within Ansible playbooks to define the structure and behavior of the playbook.

They provide additional context and instructions to Ansible.
```
Example (using the `gather_facts` keyword):
```
- name: Collect system facts
  hosts: my_servers
  gather_facts: true
  tasks:
    - name: Display the operating system
      debug:
        msg: "The OS is {{ ansible_facts['distribution'] }}"
```
In this example, the gather_facts keyword instructs Ansible to collect facts about the target hosts, such as the distribution of the operating system.

# Parameters:
```
Parameters are settings or options that you provide to Ansible modules and keywords.

They allow you to customize the behavior of modules and control how tasks are executed.
```
Example (using `parameters` with the yum module):
```
- name: Install a package
  hosts: my_servers
  tasks:
    - name: Install Apache
      yum:
        name: httpd
        state: present
```
In this example, the yum module is used to install the Apache package (httpd). The `name` and `state` are parameters provided to the `yum` module to specify the package to install and the desired state.

---

# Commonly Used Modules
Ansible provides a variety of modules to perform tasks on managed nodes. Here are some commonly used modules:

## file : Manage files and directories. 

Common parameters include:

`name`: Path to the file or directory.

`state`: Desired state (present, absent, directory, etc.).

`content`: Content to write to the file (used with state: present).

`mode`: File/directory permissions (e.g., 0644, 755).

## template : Generate configuration files using Jinja2 templating. 

Common parameters include:

`src`: Path to the template file.

`dest`: Destination path for the generated file.

`owner`: Owner of the generated file.

`group`: Group ownership of the generated file.

`variables`: Used within the template for dynamic content.

## copy : Copy files or directories from one location to another. 
Common parameters include:

`src`: Source path of the file or directory.

`dest`: Destination path for the copied item.

`owner`: Owner of the copied item.

`group`: Group ownership of the copied item.

## package : Manage software packages. 
Common parameters include:

`name`: Package name to install, upgrade, or remove.

`state`: Desired state (present, absent, latest, etc.).

`version`: Specific version of the package to install (optional).

## service : Manage system services. 
Common parameters include:

`name`: Name of the service.

`state`: Desired state (started, stopped, restarted, enabled, disabled).

`enabled`: Whether the service should be enabled at boot (yes/no).

## user : Manage user accounts and groups. 
Common parameters include:

`name`: Username to create, modify, or delete.

`state`: Desired state (present, absent).

`groups`: Groups the user belongs to (list).

`password`: User password (encrypted, use with caution).

## git : Clone repositories from Git. 
Common parameters include:

`repo`: Repository URL.

`dest`: Destination path.

`update`: Whether to update the repo.

## command / shell : Execute shell commands on remote hosts. 
Common parameters include:

`cmd`: Command to execute.

`creates`: Path to a file indicating command success.

`warn`: Enable or disable warnings.

`chdir`: Change to a specified directory before executing the command.

## debug: Print debug information during playbook execution. Common parameters include:

`msg`: Message to print.

---

# Essential Keywords
 Words or phrases used within Ansible playbooks to define the structure and behavior of the playbook. Here are some essential keywords:

## gather_facts : Collect facts about target hosts. 
Common parameters include:

`gather_subset`: Subset of facts to collect.

`gather_timeout`: Timeout for gathering facts.

`gather_timeout_msg`: Message to display on timeout.

## when : Conditional execution of tasks based on specified conditions.
Common parameters include: Conditions for task execution.

## vars : Define variables for the playbook. 
Common parameters include: Variable names and values.

## hosts : Targets a specific group of systems defined in the inventory file. 
Playbooks can target different groups based on their requirements.

## become : Execute tasks with elevated privileges (sudo). 
Common parameters include:

`become_user`: User to become.
`become_method`: Privilege escalation method.
`become_flags`: Additional flags for privilege escalation.

---

# Example Playbook Snippets
## Installing a Package
```
- name: Install Nginx
  hosts: web_servers
  tasks:
    - name: Ensure Nginx is installed
      package:
        name: nginx
        state: present
```
This playbook installs Nginx on the target servers using the package module.

## Configuring a Service
```
- name: Configure Nginx
  hosts: web_servers
  tasks:
    - name: Copy Nginx configuration file
      copy:
        src: /path/to/nginx.conf
        dest: /etc/nginx/nginx.conf
      notify: Restart Nginx
```
This playbook copies an Nginx configuration file using the copy module and triggers a service restart using a handler.

## Managing Users
```
- name: Create User
  hosts: all_servers
  tasks:
    - name: Ensure user exists
      user:
        name: john_doe
        state: present
        groups: developers
```
This playbook creates a user named john_doe and adds them to the developers group using the user module.

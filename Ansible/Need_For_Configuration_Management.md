
# **IT Infrastructure Automation**

### Configuration Management
```
Configuration management is the process of managing and maintaining the configuration of servers or infrastructure systematically and efficiently.

It involves tasks like server configuration, software installations, security updates, and maintaining consistent configurations across multiple servers.
```
## Challenges in Manual Server Management
```
-  Consider a scenario where a system administrator is tasked with managing a company's servers. 
-  These servers may run different operating systems, such as Linux distributions like CentOS and Ubuntu, and require routine tasks like upgrades, security patches, and software installations.
-  Managing configurations manually becomes increasingly difficult with a growing number of servers.
-  Logging into each server and performing tasks became impractical. The process is time-consuming, especially when dealing with hundreds or thousands of servers.
-  Writing shell scripts or PowerShell scripts to automate for each server and distribution becomes complex and hard to maintain across different server distributions (e.g., Ubuntu, CentOS) and in different programming languages 
-  The tasks performed on servers include security updates, upgrades, and installations. For different server distributions (e.g., CentOS, Ubuntu), commands may vary. Managing these differences manually for hundreds of servers is challenging.
```
## Configuration Management Tools
```
-  Configuration management tools like Puppet, Chef, Ansible, and SaltStack automate the management of server configurations. 
-  These tools provide a way to define and manage configurations using code and scripts.
-  They play a crucial role in handling security updates, upgrades, and installations.
```
---

## Ansible

- Developed and regularly updated by Red Hat.
- Written in Python.

### Ansible's Mechanism

- **Push Mechanism:**
  - No need to set up a master-slave architecture.
  - Configurations are pushed from the administrator's system to the target systems.
  - Administrators can write Playbooks on their local machines and push configurations to target servers.

- **Requirements:**
  - SSH connectivity between the administrator's and target systems.
  - Passwordless authentication should be enabled.

- **Agentless Model:**
  - Unlike Puppet and Chef, Ansible operates with an agentless model.
  - No need to install agents or software on target servers.

- **Code Structure:**
  - Code is written in Playbooks, YAML files, and ad-hoc commands.

## Puppet and Chef

### Puppet

- **Pull Mechanism:**
  - Operates on a pull mechanism.
  - Master-slave configuration is needed.

- **Agent Installation:**
  - Agents are installed on target nodes.

- **Periodic Checks:**
  - Agents periodically check for updates on the master server.
  - Manifests containing instructions are applied.

### Chef

- **Pull Mechanism:**
  - Similar to Puppet, Chef follows a pull mechanism.

- **Cookbooks:**
  - Configurations are defined in cookbooks.

## Comparison with Other Tools
- Ansible's architecture differs from tools like Puppet and Chef.
- **Push Model vs. Pull Model:**
  - Puppet and Chef follow a pull model, where target servers periodically request updates from a central server.
  - Ansible, in contrast, uses a push model, simplifying setup with a direct push from the administrator's machine.
- **Agentless Model:**
  - Ansible's agentless model eliminates the need for configuring target servers as slaves or agents.
  - Thus eliminating the need to install agents or software on target servers.

---

## Getting Started with Ansible

### Passwordless Authentication
```
-  To use Ansible, passwordless authentication should be set up between the administrator's machine and the target servers.

-  Ansible allows managing configurations by specifying server names or IP addresses in an inventory file.
```
## Programming Language

### YAML in Ansible
Ansible uses YAML, a familiar language, making it advantageous compared to Puppet, which requires learning a specific language.

## Supported Platforms

### Linux and SSH
Ansible is best for Linux using SSH protocol for connections.

### Windows and WinRM
For Windows, Ansible uses WinRM (Windows Remote Manager) protocol.

### Ansible's Benefits
Ansible offers a push model, agentless architecture, and easy-to-understand Playbooks, making it a go-to tool for configuration management.


## Idempotent Automation
- One major benefit of Ansible is its idempotent automation.
- If a command is executed, and the desired state is already achieved, Ansible ignores redundant actions.
- This feature prevents conflicts and duplicate resource creation, distinguishing it from tools like Terraform that may lack this idempotent behavior.



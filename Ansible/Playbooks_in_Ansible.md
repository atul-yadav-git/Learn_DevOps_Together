# Ansible Playbooks

## Definition
Playbooks in Ansible are the orchestration scripts that define a set of tasks to be executed on remote hosts. They are written in YAML and serve as the entry point for Ansible execution.

## Key Components

### YAML Syntax
- Playbooks are written in YAML, a human-readable data serialization language.
- YAML uses indentation for structure, and each task is a key-value pair.

### Hosts and Inventories
- Playbooks define which hosts to target by specifying inventory (a list of hostnames or IPs).
- Hosts can be grouped logically, and playbooks can target specific groups or individual hosts.

### Tasks
- Playbooks consist of a list of tasks, each defining a module to be executed on the target hosts.
- Tasks are written in a declarative style, defining the desired state of the system.

### Handlers
- Handlers are tasks that are only executed if notified by other tasks.
- They are defined separately in a `handlers` section and can be triggered by `notify` statements in tasks.

### Variables
- Playbooks can use variables to make them more flexible and reusable.
- Variables can be defined at different levels, including playbook, role, and host levels.

### Loops and Conditionals
- Playbooks support loops and conditionals to make them more dynamic.
- This allows you to iterate over lists of items or execute tasks based on conditions.

### Includes and Imports
- Playbooks can include or import other playbooks, making it easier to reuse common tasks or group related functionality.

---

### A typical structure for an Ansible playbook:

```
# playbook.yml

- name: Playbook Title
  hosts: target_servers
  become: true  # If elevated privileges are required for tasks

  tasks:
    - name: Task 1
      module_name:
        parameter1: value1
        parameter2: value2

    - name: Task 2
      module_name:
        parameter1: value1
        parameter2: value2

    # Additional tasks...

  handlers:
    - name: Restart Service
      service:
        name: my_service
        state: restarted
```

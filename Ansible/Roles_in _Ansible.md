# Ansible Roles

## Definition
Role in Ansible is a way of bundling automation content. 

It contains a set of tasks, variables, files, and handlers organized in a specific directory structure.

## Key Components

### Roles Directory Structure
![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/dd43465b-e2c9-46b3-a1ac-337c889975ac)


Each subdirectory has a specific purpose:
- `tasks`: Contains the main tasks for the role.
- `handlers`: Holds handler tasks, which are notified by tasks and run at the end.
- `templates`: Contains Jinja2 templates for dynamically generating files.
- `files`: Stores static files that are copied to the target system.
- `vars`: Contains variable definitions.
- `defaults`: Holds default variable values.

### main.yml Files
- `main.yml` files in each directory are where you define the actual content of your role.
- For example, `tasks/main.yml` contains the primary tasks for the role.

### Role Execution Flow
- Ansible follows a predictable execution flow when it encounters a role in a playbook.
- Tasks in the `tasks/main.yml` file are executed first, followed by handler tasks in the `handlers/main.yml` file.

### Reuse and Modularity
- Roles are a way to divide a playbook into parts for better reusability.
- You can use roles across different playbooks and projects, reducing duplication of code.

![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/47761fde-22a6-4e3c-9700-ec1231072d95)

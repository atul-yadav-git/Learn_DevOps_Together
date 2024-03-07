# Ansible Handlers

## Introduction

-  In Ansible, handlers play a crucial role in triggering specific actions (tasks) in response to events. 
-  They are particularly useful for restarting services or executing other actions after specific tasks have been completed.

## Defining a Handler

-  Handlers are defined within the `handlers` directory inside a role. 
-  The main file for handler definitions is `handlers/main.yml`.
-  Each handler has a name and a list of tasks associated with it. Here's an example:

```yaml
---
- name: Restart Apache
  ansible.builtin.service:
    name: apache2
    state: restarted
```
In this example, the handler named "Restart Apache" utilizes the ansible.builtin.service module to restart the Apache service.

## Triggering a Handler
-  Handlers do not execute automatically; they are triggered by tasks.
-  When a task induces a change that necessitates a handler to run, you use the notify keyword in that task.
-  This specifies which handler(s) should be triggered if the task modifies something. Example:

```yaml
---
- name: Ensure Apache is installed
  ansible.builtin.package:
    name: apache2
    state: present
  notify: Restart Apache
```
This task installs the Apache package, and if the installation results in changes to the system, the associated handler "Restart Apache" is notified and will be triggered.

## Running Handlers
-  Handlers run at the end of the playbook, after all tasks have been executed.
-  Ansible checks if any handlers have been notified, and if so, it runs them.
-  The playbook structure typically includes a section for tasks and another for handlers:

```yaml
---
tasks:
  - name: Ensure Apache is installed
    ansible.builtin.package:
      name: apache2
      state: present
    notify: Restart Apache

handlers:
  - include_tasks: handlers/main.yml
```
The include_tasks directive ensures that the handler tasks from handlers/main.yml are executed at the appropriate time.

## Conclusion
-  Handlers are a valuable feature in Ansible for tasks that should be executed selectively, optimizing the playbook's execution. 
-  They are organized in a separate file within the role's structure to maintain clarity and structure.

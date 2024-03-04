# **Ansible Vault and Variable Management**
## Ansible Vault
Ansible Vault is a crucial feature for securely storing sensitive information. 

It provides commands to encrypt/decrypt data and secure variables, ensuring confidentiality. 

[Ansible Vault Official Documentation](https://docs.ansible.com/ansible/latest/vault_guide/index.html)

## Directory Structure for Efficient Management:

![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/95c9b85d-f6e8-4fa1-941b-99fa4e9dcc44)

## Basic Commands and Usage

Checking Vault Version
```
ansible-vault --version
```

View Vaulted File
```
ansible-vault view your_vault_file.yml
```
Edit Vaulted File
```
ansible-vault edit your_vault_file.yml
```
Running Playbook with Vault Password Prompt
```
ansible linux_servers -m ping -vvv --ask-vault-pass
```
Encrypting a single value
```
ansible-vault encrypt_string <secret> --ask-vault-pass
```
Creating a encrypted file 
```
ansible-vault create <credential.yml>
```
Decrypt file
```
ansible-vault decrypt <credentials.yml>
```

## Understanding Vault Password Handling


Vault Password
```
Set the ANSIBLE_VAULT_PASSWORD_FILE environment variable or enter the vault password using --ask-vault-pass.
```
Vault File Path:
```
Vault file (e.g., ansible-credentials.yml) should be in the same directory as the inventory file or specified correctly in Ansible commands.
```

## Keeping Vaulted Variables Visible
To keep variable names accessible without exposing secrets

### Group Variables Setup:

-  Create a group_vars/ subdirectory named after the group (e.g., linux_servers).

  ![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/1b6713fa-4743-43a6-a380-facbab557b5a)

-  Inside, have two files named vars and vault.

  ![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/2dd05880-c8c5-4110-94c7-c6cf2b37b782)

### Define Variables:

-  In vars, define all variables needed, including sensitive ones.

  ![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/2ed850ae-0785-44d4-a1aa-6032f2addb53)

-  In vault, copy sensitive variables from vars and prefix with vault_.

  ![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/2c560a90-3159-4eb6-a08d-496e6b52a965)

### Jinja2 Syntax:

Adjust vars to use Jinja2 syntax pointing to matching `vault_` variables. To reference variables from the vault file.

![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/a6fd65e4-f449-4f31-ba1f-14e94418bd4c)


### Encrypt Vault Files:

Encrypt each vault file separately.

![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/5368283c-5357-450c-98a5-d6ab5396f9d5)


### Update Inventory File:

-  Reference vars files for each server in the inventory file.

-  Use variable names from vars file in playbooks.

 ![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/4150bc3d-7335-41ae-9fe4-7d7f94cb72e9)


### Run Playbooks:

-  Ansible will dynamically decrypt variables during playbook execution.

-  This approach maintains security while efficiently organizing and referencing multiple parameters.

```
sudo ansible linux_servers -m ping --ask-vault-pass
```


Example Inventory File:

![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/33a7fc96-6847-41a7-b92c-75575c694d35)


-   Here each server can have its own unique vars and secret file or they can have common group vars and secret file




## Setting ANSIBLE_VAULT_PASSWORD_FILE Environment Variable

Example: `ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt`

Useful for automation systems like Jenkins.



## Disabling Strict Host Key Checking
-  Adding `StrictHostKeyChecking=no` to SSH common arguments in the inventory file disables strict host key checking. 

-  While convenient, it compromises security by removing host authenticity verification, it impacts security.


## File-Level vs. Variable-Level Encryption
File-Level Encryption:
```
-  Encrypts the entire file and is decrypted on load or reference.
-  Suitable for inventory and actions dealing with files.
```
Variable-Level Encryption:
```
-  Encrypts specific variables inside a variable file.
-  Decrypts on demand, allowing mixing of vaulted and non-vaulted variables.
-  Supports easy legibility but may complicate password rotation.
```
## Ansible Vault Filters and Lookup Plugins
`ansible.builtin.vault` : Used for encrypting data within playbooks or tasks.

`ansible.builtin.unvault` : Lookup plugin to decrypt vault-encrypted data during playbook execution.

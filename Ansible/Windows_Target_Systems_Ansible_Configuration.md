# **Ansible Configuration for Windows Target Systems**

[Ansible Official Documentation for Windows target setup](https://docs.ansible.com/ansible/latest/os_guide/windows_setup.html)

[Ansible Official Documentation for WinRM Windows](https://docs.ansible.com/ansible/latest/os_guide/windows_winrm.html)

## Install pywinrm on Control system:

For Windows target systems, Ansible uses the `pywinrm` library to manage Windows systems through WinRM (Windows Remote Management).

```
pipx inject ansible pywinrm
```
If you installed ansible with pipx or else follow guide for pip

```
sudo dnf install python3-pip
sudo pip3 install pywinrm
sudo dnf install python3-winrm
```
If you installed ansible with dnf
```
# For Python 3.11 using pip

sudo dnf install python3.11-pip
sudo python3.11 -m pip install pywinrm
```
If the above doesn't work, use the following:
```
sudo dnf groupinstall "Development Tools"
sudo dnf install python3-devel libffi-devel openssl-devel
pip3 install pywinrm
```

Activate the user-specific environment where pywinrm is installed:
```
source ~/.bashrc  # or source ~/.bash_profile, depending on your shell configuration
```

---

## Verify and Enable WinRM on Windows Target Server:

*Open an administrative PowerShell window on target windows server.*

### 1. Run the following commands to enable WinRM:
```
Set-ExecutionPolicy RemoteSigned -Force
Enable-PSRemoting -Force
```

### 2. Configure WinRM Listeners:

Run the command: `winrm quickconfig`

### 3. Verify WinRM service:

Run the command: `Get-Service WinRM`

Check if the status is "Running". If not, start the service using: `Start-Service WinRM`

### 4. Allow WinRM through Windows Firewall:

```
New-NetFirewallRule -Name winrm -DisplayName "Windows Remote Management (HTTP-In)" -Enabled True -Direction Inbound -Protocol TCP -LocalPort 5985
```
This command creates a firewall rule that allows incoming connections on port 5985, enabling communication for WinRM with your Ansible control machine.

### 5. WinRM Configuration:

*Note: For windows instead of password best to setup ssl certificate or other authentication methods over password-based.*

-  By default, WinRM will fail to work when running over an unencrypted channel. 
-  The WinRM protocol considers the channel to be encrypted if using HTTPS or using message-level encryption.

```
Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true
Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value $true
```
To disable the encryption requirement on the Windows host. This should only be used for development and debugging purposes.

---


## Do Rule opening for WinRM Ports on Target Windows Servers:

If using cloud providers like Azure or AWS, then open port `http: 5985` and `https:5986` for inbound traffic.

## Update the inventory file for Windows target systems:

ini syntax inventory file
```
[windows_servers]
server_1 ansible_host=<public ip or dns> ansible_user=<username> ansible_password=<password> ansible_port=5985 ansible_connection=winrm
server_2 ansible_host=<public ip or dns> ansible_user=<username> ansible_password=<password> ansible_port=5985 ansible_connection=winrm
```

yaml syntax inventory file
```
windows_servers:
  hosts:
    server_1:
      ansible_host: <public ip or dns>
      ansible_user: <username>
      ansible_password: <password>
      ansible_port: 5985
      ansible_connection: winrm
    server_2:
      ansible_host: <public ip or dns>
      ansible_user: <username>
      ansible_password: <password>
      ansible_port: 5985
      ansible_connection: winrm
```
## Test connectivity using:
```
ansible [public ip] -m win_ping
ansible windows_servers -m win_ping
```
*Note: Ensure proper security measures when dealing with passwords and sensitive information.*

---

## Free Tier AWS and Azure windows servers: For Target servers

-  AWS Windows Server 2022 AMI: `ami-02ed1a17d1bd5f706; t2.micro; 30GB gp3 storage`

-  Azure Windows 2022 Datacentre: 
```
Standard_B1s; {"publisher":"MicrosoftWindowsServer","offer":"WindowsServer","sku":"2022-datacenter-azure-edition-smalldisk","version":"latest"} ; Standard HDD LRS 64 gb storage type 
```
-  Azure Windows 2022 Core:
```
Standard_B1s ; {"publisher":"MicrosoftWindowsServer","offer":"WindowsServer","sku":"2022-datacenter-azure-edition-core-smalldisk","version":"latest"} ; Standard HDD LRS 64 gb storage type 
```

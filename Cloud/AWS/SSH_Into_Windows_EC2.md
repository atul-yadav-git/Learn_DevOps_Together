# **EC2 Windows SSH Passwordless Remote Access Configuration**

## Enabling SSH on AWS Windows EC2
- SSH server is not present by default on Windows EC2 instances.
- Need to Install and start SSHD services on Windows for PuTTY access.
- Allow port 22 in ec2 security rules and in windows firewall inbound settings for Windows EC2.
```
- SSH Server:  To accept and manage SSH connections.
- SSH Agent: To manage private keys and simplify authentication.
```
## Chocolately - Windows Package Manager
- Chocolately is a Windows package manager, similar to Yum or RPM on Linux.
- Used for installing, upgrading software, and managing packages.

## SSH server configuaration in Windows General Flow
1. **First RDP Access:**
   - Initiate the first-time Remote Desktop Protocol (RDP) connection to the EC2 instance.

2. **Install SSH Server and SSH Agent:**
   - Open PowerShell and run the following commands:
     ```powershell
     # Install SSH Server
     Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

     # Install SSH Agent
     Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
     ```

3. **Set Service Startup and Start Services:**
   - Configure the SSHD and SSH Agent services to start automatically:
     ```powershell
     # Set SSHD service to start automatically
     Set-Service -Name sshd -StartupType 'Automatic'

     # Set SSH Agent service to start automatically
     Set-Service -Name ssh-agent -StartupType 'Automatic'

     # Start SSHD service
     Start-Service sshd

     # Start SSH Agent service
     Start-Service ssh-agent
     ```

4. **Create administrators_authorized_keys File:**
   - Navigate to `C:\ProgramData\SSH`.
   - Create the `administrators_authorized_keys` file.

5. **Set Permissions:**
   - Use `Get-ACL` and `Set-ACL` PowerShell commands to set the same permissions as `ssh_host_dsa` key:
     ```powershell
     # Example: Set permissions on administrators_authorized_keys
     Get-ACL C:\ProgramData\SSH\ssh_host_dsa_key | Set-ACL -Path C:\ProgramData\SSH\administrators_authorized_keys
     ```

6. **Restart SSH Server and Agent:**
   - Restart the SSHD service and SSH Agent:
     ```powershell
     # Restart SSHD service
     Restart-Service sshd

     # Restart SSH Agent
     Restart-Service ssh-agent
     ```


## Chocolatey Installation for Windows EC2
```
Follow documentation available online
```
## **SSH Configuration for Windows EC2**

### Install and start SSHD for PuTTY.
```
-  Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
-  Set-Service -Name sshd -StartupType Automatic
-  Start-Service sshd
```
### Install and start SSH agent for PuTTY.
```
-  Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
-  Set-Service -Name ssh-agent -StartupType Automatic
-  Start-Service ssh-agent
```
### Create administrators_authorized_keys file.
create file and put public key in it : `'C:\ProgramData\ssh\administrators_authorized_keys'`

### Set appropriate permissions on administrators_authorized_keys.
```
Get-ACL C:\ProgramData\ssh\ssh_host_dsa_key | Set-ACL $AuthorizedKeysPat
```

### Restart SSH agent and SSHD server.
```
-  Restart-Service ssh-agent
-  Restart-Service sshd
```

## AWS Key-Based Authentication on Windows EC2
- Private key (.pem, .ppk) downloaded locally.
- Public key stored on the EC2 instance.
- Modified sshd_config file for PubKeyAuthentication and PasswordAuthentication.

## SSH Passwordless Authentication on Windows EC2
- Installed and started SSH server and agent.
- Created administrators_authorized_key file for passwordless authentication.
- Set appropriate permissions on administrators_authorized_keys.
- 

## **Additional PowerShell Commands for Windows EC2**
### PowerShell command similar to df -h.
```
Get-PSDrive
```

### Check environment variable PATH in PowerShell.
```
$env:PATH
```

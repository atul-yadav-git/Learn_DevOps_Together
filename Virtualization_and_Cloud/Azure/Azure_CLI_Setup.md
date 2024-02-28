# Azure CLI Installation and Configuration on CentOS 8
---
**[Azure CLI Official Documentation](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)**
---
## Azure CLI Installation

```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
sudo dnf install azure-cli
```
## Verify Installation
```
az --version
```
```
which az
```
## Azure CLI Configuration with Device Code
This method involves the Azure CLI prompting your terminal for a code, enhancing security.
```
az login
```
Follow the instructions displayed in the terminal and enter the code on a separate device with a web browser.

Once successful, the terminal on your CentOS machine will display a confirmation message.


## Azure Cloud Shell
This option involves using a web-based terminal environment provided by Microsoft Azure.

Steps:
-  Navigate to the Azure portal.
-  Open the Azure Cloud Shell from the top navigation bar.
-  Follow the on-screen prompts to sign in to your Azure account.
-  Use the Azure CLI within the Cloud Shell to manage your Azure resources.


---
## Programmatic Access to Azure Resources on CentOS 8

**[Azure Service Principal Official Documentation](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli-service-principal)**

Service Principal Authentication is the recommended approach for programmatic access, providing enhanced security.


Log in to the Azure portal:
```
Navigate to Azure Active Directory. Microsoft Entra ID is the new name for Azure Active Directory.
```
Create a new application:
```
Under "Manage," select "Applications."
Click on "New application."
Enter a unique name and select "Accounts in any organizational directory."
```
Assign roles to the service principal:
```
Under "Manage," select "Roles and administrators."
Click on "Add role" and choose the appropriate role.
Assign the role to the service principal.
```
Create a secret for the service principal:
```
Under "Manage," select "Certificates & secrets."
Click on "New client secret," enter a description, and set an expiry period.
Copy and securely store the generated secret.
```
Note down the following information:
```
Application (client) ID (from the service principal's overview).
Directory (tenant) ID (from "Azure Active Directory" overview).
```
Use the obtained information to configure Azure CLI on CentOS 8.
```
az login --service-principal -u <client-id> -p <client-secret> --tenant <tenant-id>
```


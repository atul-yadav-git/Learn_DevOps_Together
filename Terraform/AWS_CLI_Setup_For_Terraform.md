# **To Provision and Manage AWS Resources through Terraform:**

## **The AWS CLI is required to be installed and configured.**

---

### AWS CLI Installation and Configuration

```yaml
Initial setup requires AWS Management Console access at least once for creating IAM users, including obtaining your Access Key ID and Secret Access Key.

Subsequent management of AWS resources and services can be done through CLI commands, SDKs, CloudFormation, or APIs prompting automation and scripting.
```
### AWS CLI Purpose:
```yaml
-  The AWS Command Line Interface (CLI) is a powerful tool that allows users to interact with various AWS resources directly from the command line.
-  It provides a convenient and efficient way to manage AWS resources, perform administrative tasks, and automate operations. 
```
### Prerequisites:
```yaml
An active AWS account.
An IAM user with appropriate permissions for the actions you intend to perform.
A CentOS system with internet access and root privileges. [Any system you work on; here CentOS is considered]
```

#### Sign in to the AWS Management Console:
```yaml
Go to AWS Management Console, and sign in or create a new AWS account.
```
#### Accessing the IAM Console:
```yaml
Log in to the AWS Management Console using your root user credentials.
In the search bar, type "IAM" and select "IAM service" from the results.
```
##### Creating an IAM User:
```yaml
Click on "Users" on the left navigation pane.
Select "Add user" to begin creating a new user.
Choose a username and select "Programmatic access" for access type.
Set permissions as needed.
```
#### Defining User Permissions:
```yaml
On the "Set permissions" page, you can either add the user to a group with specific permissions or attach policies directly.
For simplicity, you can attach the "AdministratorAccess" policy, which grants full access to AWS services.
Choose an existing policy or create a custom policy.
```
#### Reviewing and Creating the User:
```yaml
Review the assigned permissions and click "Create user."
```
*Important: Download the secret access key immediately and securely. You will not be able to view it again once you leave this page*

#### Downloading and Storing Access Keys:
```yaml
Download the Access Key ID and Secret Access Key.
Securely store the keys.
Remember to follow security best practices and avoid sharing your access keys.
```
### Accessing AWS Account via CLI on CentOS

To access your AWS account using the AWS Command Line Interface (CLI) from your local CentOS system, follow these steps:

#### Step 1: Install AWS CLI on CentOS

### Official Documentation for AWS CLI Installation
[Link to AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
*Official AWS documentation for installing AWS CLI.*


#### Step 2: Configure AWS CLI

Run the following command to configure your AWS CLI:
```yaml
aws configure
```
You will be prompted to enter the following information:
```yaml
[default]
aws_access_key_id = YOUR_ACCESS_KEY_ID
aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
region = The AWS region you want to use (e.g., us-east-1)
output format: You can leave this as the default (json)
```
Replace YOUR_ACCESS_KEY_ID and YOUR_SECRET_ACCESS_KEY with your actual AWS access key and secret key.

#### Step 3: Verify Configuration
To verify that your AWS CLI is configured correctly, run a simple command such as:
```yaml
aws ec2 describe-instances
```
This command should return information about your EC2 instances if they exist.

Now, you should be able to use AWS CLI commands to interact with your AWS resources directly from your CentOS system.

### Security best practices:
```yaml
Grant only the minimum necessary permissions.
Use strong passwords and rotate them regularly.
Consider using temporary credentials (IAM roles) for long-running processes.
Enable multi-factor authentication (MFA) for your IAM users.
```
### AWS CLI Configuration Files
```yaml
The AWS CLI configuration is stored in two files: `~/.aws/config` and `~/.aws/credentials`. 

After you've entered this information, the AWS CLI will store these configurations, and you won't need to provide them each time you run an AWS CLI command.

You can always update these configurations by running aws configure again.

Now, you should be able to use AWS CLI commands to interact with your AWS resources directly from your CentOS system.
```

Once this initial setup is complete, you can use the AWS CLI for subsequent interactions without needing to access the AWS Management Console. 

It allows for automation and scripting of AWS-related tasks from your local machine.

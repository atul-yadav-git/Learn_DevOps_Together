# **Setting Up Git and SSH Authentication with GitHub**

## Steps to Setup Git on Local System and Establish SSH Authentication with GitHub

## Installation and Configuration

First, ensure that Git is installed on your cloud instance or local system:

```
sudo yum install git -y
```
Then, configure Git globally with your username and email. 

Use your GitHub account username and the noreply email provided by GitHub:
```
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```
### Generate SSH Key

```
ssh-keygen -t rsa -b 4096 -C "any comment"
```
### Add SSH Key to SSH Agent

```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

### Add SSH Key to GitHub: 
```
Copy your SSH key:
cat ~/.ssh/id_ed25519.pub
Go to GitHub -> Settings -> SSH and GPG Keys -> New SSH Key, then paste the key and click Add SSH Key.
```
### Test SSH Connection:
```
ssh -T git@github.com
A successful connection will display a welcome message from GitHub.
```
## Initialize Git in Local Repository

```
git init
git add .
git commit -m "commit message"
```
## Configure Git User Information

```
git config --global user.name "Your Name" # Use GitHub account username
git config --global user.email "your.email@example.com" # Use GitHub noreply email
```
## Check Linked Remote GitHub Repositories

```
git remote -v # List linked remote GitHub repositories
```
## Add GitHub Repository as Remote

```
git remote add origin git@github.com:username/repo.git # Replace with your SSH URL
```
## Push to GitHub

```
git push -u origin master # Replace 'master' with your branch name
```
## Steps to Create a New GitHub Repository and Add It as Remote to Local Git Repository

### Create a New GitHub Repository
```
Go to GitHub and log in.
Click on the "+" sign in the top right corner and select "New repository."
Fill in repository details and click "Create repository."
Copy Repository SSH URL
Copy the SSH URL from the GitHub repository page (e.g., git@github.com:username/repo.git).
```
### Navigate to Local Git Repository
```
Open a terminal or command prompt and navigate to the local Git repository.
```
### Add GitHub Repository as Remote

```
git remote add origin git@github.com:username/repo.git # Replace with your copied URL
```
## Push to GitHub

```
git push -u origin master # Replace 'master' with your branch name
```
## Verify on GitHub
Refresh your GitHub repository page to see your code and files.
```

Note: Replace placeholders like "Your Name," "your.email@example.com," "username," and "repo" with your actual information. The instructions assume correct SSH key setup to avoid username/password prompts.
```

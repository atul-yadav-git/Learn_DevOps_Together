
# **Getting Code from GitHub to Local Git Repository**

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
## SSH Authentication Setup
Setup SSH authentication between your local Git repository and GitHub remote repository:
```
ssh-keygen -t rsa -b 4096 -C "any comment"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```
## Cloning GitHub Repository to Local System
Navigate to the directory where you want to clone the repository, then use the following command:
```
git clone "git@github.com:username/repo-name.git" # Replace with SSH URL of GitHub repo
```
This command clones the GitHub repository to your local system. As SSH authentication is already set up, it won't prompt for a username or password.

## Updating Local Repository with Changes from GitHub
To update your local repository with changes made in the GitHub remote repository, use:

```
git pull <remote-repo> <branch-name> # e.g., git pull origin master
```
Alternatively, you can use git fetch followed by git merge to achieve the same result. The git pull command combines these steps.

Note: Conflict resolution may be required when pulling changes from the remote repository. Ensure you resolve any conflicts appropriately.
```
This guide outlines the process of setting up Git, establishing SSH authentication, cloning a GitHub repository to a local system, and updating the local repository with changes from GitHub. Adjust the commands as per your specific repository details.
```

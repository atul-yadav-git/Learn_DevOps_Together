# **Basic Theory on Git, GitHub, and Version Control**
## Git vs. GitHub
GitHub: Remote repository (online platform for code storage and collaboration).
Git: Local system repository (facilitates version control and development).
## Getting Started with GitHub
```
Account Creation:

Login to console.
GitHub account creation only on the GitHub platform.
After account creation, repositories can be created on GitHub and linked as remotes to local Git repositories.
```
## Local Git Setup:
```
Install and configure Git.
Navigate to the desired directory in the terminal.
Execute git init to create a local repository ( .git directory).
```
## Git Commands Overview
```
git init: Create local repository.
git add .: Stage changes for commit.
git commit -m "message": Save changes.
git status: Check the tree.
git log --oneline: View commit history.
git branch: List branches.
git checkout "branchname": Move to a branch.
git merge "branch_to_merge": Merge into the main branch.
git rebase "branch_to_rebase": Rebase onto the main branch.
git checkout -b "branchname": Create and move to a branch.
git clone "url": Copy remote repo to local (as "origin").
git remote add "remote_name" "url": Link remote repo with a custom name.
git remote -v: Display details of linked remote repos.
git push, pull, fetch: Code synchronization.
curl: Access GitHub details using Personal Access Token (PAT) and username.
```
## Git Branching
Branches in Git separate code changes, enabling parallel development.
```
Important branches: 
            main/master
            feature 
            release 
            hotfix
            develop
```
## Authentication Methods
Problem Statement
Understanding the differences between Personal Access Token (PAT) and SSH key pair authentication for GitHub and local Git systems.
```
Solution
PAT (Personal Access Token):

Used instead of a password for GitHub CLI or API authentication.
Essential for scripting and GitHub API interactions.
SSH Key Pair:

Configures local Git system with GitHub account.
Enables background authentication without entering tokens.
Recommended for fixed Git systems.
```
Detailed guides:

Creating and using Personal Access Tokens
Generating and using SSH keys
Official Documentation
Refer to the official documentation for in-depth insights and guidelines.

## Git Basics
Git is a distributed version control system.

Records changes to files over time.

Enables easy version recall and parallel development.

## Staging in Git
Staging allows selective inclusion of changes in the next commit.

Serves as a preparation area for commits.

Review changes before committing for a clean history.

## Continuous Development with Staging

Keep working directory in continuous change.

Experiment with new ideas without committing every change.

The staging area separates work-in-progress from ready-to-commit changes.

## Branching in Git - Explained
Each branch represents an independent line of work.

Allows work on different features, bug fixes, or experiments.

Branches are lightweight and easily created, switched, and merged.

## Local Repository Remote Tracking Branches
Remote tracking branches are local references to remote branches.

Facilitates tracking, fetching updates, and comparing local changes with remote branches.

Example: If "origin" is a remote repository with a "develop" branch, Git creates a local remote tracking branch named "origin/develop."

## Essential Git Commands (20%)
```
git config
git init
git clone
git status
git add
git commit
git push
git pull
git branch
git checkout
git merge
git diff
git log
git show
git tag
git reset
git rm
git stash
git rebase
git fetch
```
## Additional Insights
Public GitHub repos expose all files; use separate private repos for sensitive content.

Git doesn't track empty folders; use placeholder files or encrypt sensitive content.

For theory files, save as Markdown (.md) for optimal rendering on GitHub.

## Gitignore File Pattern

Patterns in .gitignore apply to the directory and its subdirectories.

Exclude files that shouldn't be tracked, like secrets or confidential information.

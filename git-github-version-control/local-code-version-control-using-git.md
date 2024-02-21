# Working on Local Code Management with Git

## Configure Git
```bash
git config --global --list
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config is used to set up Git configuration options.
The --global flag sets the configuration globally for all repositories on your machine.
Common configuration options include user.name and user.email.
Initialize a Git Repository
bash
Copy code
git init
git init creates a new Git repository.
By default, it initializes the repository in the current directory.
The directory becomes a Git repository with a .git subdirectory.
Check Repository Status
bash
Copy code
git status
git status shows the current state of the working directory and staging area.
It displays information about modified files, untracked files, and the current branch.
Stage Changes
bash
Copy code
git add filename
git add .
git add --all/-A
git add is used to add changes or new files to the staging area.
Use specific file(s) or wildcards for various staging options.
Commit Changes
bash
Copy code
git commit -m "message"
git commit saves changes in the staging area to the repository.
-m allows you to add a commit message.
Branch Operations
bash
Copy code
git branch
git branch new-feature
git branch -d old-feature
git branch -D outdated-feature
git branch lists, creates, or deletes branches in a Git repository.
-d deletes a branch if merged, and -D deletes a branch regardless of merge status.
Switch Between Branches
bash
Copy code
git checkout feature-branch
git checkout -b bug-fix
git checkout -- index.html
git checkout <hash value>
git checkout -
git checkout is used to switch between branches or restore files from a previous commit.
Create and switch to a new branch with -b.
View Commit History
bash
Copy code
git log
git log --oneline
git show commithash
git log displays commit history.
--oneline provides a concise summary.
git show shows detailed information about a commit.
Merge Branches
bash
Copy code
git merge branch1
git merge feature-branch main
git merge integrates changes from one branch into another.
Resolve conflicts manually if needed.
Rebase
bash
Copy code
git rebase "branch_name"
git rebase incorporates changes from one branch onto another.
Interactive rebase allows more control over the process.
Difference Analysis
bash
Copy code
git diff
git diff <commit>
git diff <commit1> <commit2>
git diff --staged
git diff <branch1> <branch2>
git diff compares changes between different states of a Git repository.
Tagging
bash
Copy code
git tag
git tag <tag_name>
git tag -a <tag_name> -m "Tag message"
git tag "tagdetail" commithash
git tag marks specific points in Git history.
Tags are useful for version releases or milestones.
Reset Changes
bash
Copy code
git reset
git reset --hard
git reset <commit_hash>
git reset HEAD <file>
git reset moves the branch pointer to a specified commit.
Use different flags for various reset behaviors.
Remove Files
bash
Copy code
git rm filename
git rm -r directoryname
git rm removes files from the Git repository.
Stash Changes
bash
Copy code
git stash save "Work in progress on feature XYZ"
git stash apply
git stash temporarily saves changes without committing.
git stash apply re-applies the most recent stash.
Get Help
bash
Copy code
git help
git help status
git help provides documentation for Git commands.
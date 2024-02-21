# **Local Code Management with Git**

## Git Configuration

### View Current Git Configuration

```
git config --global --list
```
##### To list current git configuration, can remove global or else put --system


### Set Git Configuration

```
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

##### git config is used to set up Git configuration options on our local machine.

##### The --global flag sets the configuration globally for all repositories on your machine.

##### Common configuration options include user.name and user.email and default branch.

## Initializing a Git Repository

```
git init
git init is used to create a new Git repository.
```

##### By default, it initializes the repository in the current directory, but you can specify a directory name as an optional argument.

##### After running git init, the directory becomes a Git repository with a .git subdirectory.

## Checking Repository Status

```
git status
```

##### git status shows the current state of the working directory and staging area.
##### It displays information such as modified files, untracked files, and the branch you are currently on.
##### It helps you track the changes made to your repository and identify the files that need to be committed.
##### The output of git status provides guidance on which Git commands to use next.

## Staging Changes with Git Add

```
git add filename
git add .
git add --all/-A
```
##### The git add command is used to add changes or new files to the staging area.

##### Syntax:

##### Add specific file(s): git add <file>

##### Add all files in the current directory: git add .

##### Add all files in the current directory and its subdirectories: git add --all or git add -A

##### Committing Changes with Git Commit

```
git commit -m "message"
git commit saves the changes in the staging area to the repository, creating a new commit with a unique identifier.
Syntax:
Commit with a message: git commit -m "Commit message"
Commit all changes, including modified and deleted files: git commit -am "Commit message"
Each commit represents a separate point in the project's history, allowing you to track and manage different versions of your code and revert changes if needed.
Branching in Git

```
git branch
git branch new-feature
git branch -d old-feature
git branch -D outdated-feature
git branch lists, creates, or deletes branches in a Git repository.
Current branch is indicated with *.
Examples:
git branch new-feature: Creates a new branch named "new-feature."
git branch -d old-feature: Deletes the branch named "old-feature" (if merged).
git branch -D outdated-feature: Deletes the branch named "outdated-feature" (even if not merged).
Switching Between Branches with Git Checkout

```
git checkout feature-branch
git checkout -b bug-fix
git checkout -- index.html
git checkout <hash value>
git checkout -
git checkout switches between branches or restores files from a previous commit.
Examples:
git checkout feature-branch: Switches to the "feature-branch."
git checkout -b bug-fix: Creates and switches to a new "bug-fix" branch.
git checkout -- index.html: Discards changes to index.html.
git checkout <hash value>: Checks out a specific commit.
git checkout -: Switches to the previously checked-out branch.
Merging Changes with Git Merge

```
git merge branch##
git merge feature-branch main
git merge integrates changes from one branch into another.
Examples:
git merge branch##: Merges "branch##" into the current branch.
git merge feature-branch main: Merges "feature-branch" into "main."
Handling Merge Conflicts
When conflicting changes occur during a merge, Git cannot automatically resolve the differences and requires manual intervention.
Conflicts can happen when the same part of a file has been modified in both the source and target branches.
Conflicted files are marked with conflict markers (<<<<<<<, =======, and >>>>>>>).
Steps to resolve conflicts:
Open conflicted file(s) in a text editor.
Locate conflict markers and manually edit the file to choose desired changes.
Save changes and close the file.
Stage resolved file(s) with git add.
Commit the merge with git commit.
Rebasing Changes with Git Rebase

```
git rebase "branch_name whose commit u want"
git rebase incorporates changes from one branch onto another, modifying the commit history.
Syntax: git rebase <branch_name>.
Interactive rebase allows more control with options like reordering, editing, squashing, etc.
Use git rebase -i <commit> for interactive rebase.
Differences Between Merge and Rebase
git merge creates a new merge commit and preserves all commit histories.
git rebase incorporates changes onto another branch, modifying commit history.
Interactive rebase allows more control over the process.
Viewing Differences with Git Diff

```
git diff
git diff <commit>
git diff <commit##> <commit###>
git diff --staged
git diff <branch##> <branch###>
git diff compares changes between various states in the Git repository.
Displaying Commit Details with Git Show

```
git show
git show <commit-hash>
git show <tag_name>
git show displays detailed information about commits and tags.
Tagging Points in Git History

```
git tag
git tag <tag_name>
git tag -a <tag_name> -m "Tag message"
git tag "tagdetail" <commit_hash>
git tag marks specific points in Git history.
Resetting Changes with Git Reset

```
git reset
git reset --hard
git reset <commit_hash>
git reset HEAD <file>
git reset moves the branch pointer or unstages changes.
Removing Files from Git with Git Rm

```
git rm filename
git rm -r directoryname
git rm removes files from the Git repository.
Temporarily Saving Changes with Git Stash

```
git stash save "Work in progress on feature XYZ"
git stash list
git stash apply
git stash temporarily saves changes for later use.
Git Help for Command Documentation

```
git help
git help <command>
git help provides documentation for Git commands.
Use git help <command> to get documentation and usage instructions for a specific Git command.

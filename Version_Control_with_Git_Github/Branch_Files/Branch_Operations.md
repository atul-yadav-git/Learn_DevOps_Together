# Git Branch Operations

## Table of Contents

- [Creating a New Branch Locally](#creating-a-new-branch-locally)
- [Pushing a Local Branch to GitHub](#pushing-a-local-branch-to-github)
- [Fetching and Working with a GitHub Branch Locally](#To-fetch-and-work-with-a-branch-created-on-GitHub-in-your-local-repository,-follow-these-steps:)
- [Merging Changes Between Branches](#merging-changes-between-branches)
- [Merging Strategies](#merging-strategies)
- [Squash Merge](#squash-merge)
  - [Squash Merging Locally](#squash-merge)
  - [Squash Merging on GitHub](#squash-merge)
- [Create a Pull Request on GitHub](#Create-a-Pull-Request-on-GitHub)

## Creating a New Branch Locally
To create a new branch on your local Git repository, use the following commands:

```bash
git branch <branchname>   # Create a new branch
git checkout <branchname> # Switch to the newly created branch
git branch                # Lists all the branches available in your local repository.
git remote -r             # List all remote branches
```
## Pushing a Local Branch to GitHub
Creating a branch locally doesn't automatically push it to GitHub. To push the branch to GitHub, use the git push command:

```bash
git push origin <branchname>  # Push the branch to the remote repository on GitHub
```
If it's the first time pushing the branch, set the upstream branch using:
```bash
git push -u origin <branchname> #"origin," which is typically the default name for the remote repository on GitHub.
```
Subsequent pushes can be done with a simple `git push` command.

---

## To fetch and work with a branch created on GitHub in your local repository, follow these steps:

Fetch the Branch

```bash
git fetch origin <branchname>
```
Switch to the New Branch
```bash
git checkout <branchname>
```
Alternatively:
```bash
git checkout -b <branchname> origin/<branchname>
```
Pull Latest Changes (Optional)
```bash
git pull origin <branchname>
```

---

## **Merging Changes Between Branches**
Branches operate independently until you decide to merge changes. Here's a basic workflow:

1. Working on Separate Branches:
Assuming you have branches named master, git, and terraform, you can work on them independently:
```bash
# Switch to the 'git' branch
git checkout git

# Make commits on the 'git' branch
# ...

# Switch to the 'terraform' branch
git checkout terraform

# Make commits on the 'terraform' branch
# ...

# Switch back to the 'master' branch
git checkout master

# Make commits on the 'master' branch
# ...
```
2. Updating Local Branches with Remote Changes:
If you make changes directly on GitHub in the 'git' branch and want to bring those changes into your local 'git' branch, you can use:
```bash
# Make sure you are on the 'git' branch
git checkout git

# Fetch changes from GitHub
git pull origin git

# Repeat this process for other branches if needed.
```
3. Merging Changes:
When you're ready to consolidate changes from one branch into another (e.g., merging changes from 'git' into 'master'), you can do the following:
```bash
# Switch to the branch where you want to merge changes (e.g., 'master')
git checkout master

# Merge changes from the 'git' branch
git merge git

# Repeat this process for other branches as needed.
```
4. Dealing with Conflicts:

-  If changes made in different branches modify the same lines of code, Git will raise conflicts during the merge process.
-  In such cases, you need to resolve conflicts manually.

5. Committing and Pushing Changes:
After merging and resolving conflicts, commit the changes:
```bash
git commit -m "Merge changes from 'git' branch into 'master'"

# Then, push the changes to GitHub:
git push origin master

# Repeat this process for other branches as needed.
```
6. Repeat as Necessary:

-  Continue working on branches, making commits, and merging changes as needed.
-  The key is to merge changes when your work is ready and tested.
-  You don't necessarily need to merge after each commit; you can consolidate changes when you feel your work on a particular branch is ready to be integrated into another. 

---

## Merging Strategies
**Merge All Commits (Default)**: This creates a new "merge commit" in master that incorporates all the commits from git.

**Squash Merge**: Combines the commits from git into a single commit in master. Use this for a cleaner history if your git branch has multiple commits for a single logical change.

**Rebase Merge**: Re-writes the history of the git branch onto master. This can lead to a cleaner linear history but might be confusing for collaborators if they've already pulled the git branch. Choose this with caution.


Default Merge
```bash
git pull origin main
```
Squash Merge
```bash
To squash merge using interactive rebase, follow these steps:

# Ensure You're Up to Date
git checkout main
git pull origin main

# Switch to the Feature Branch
git checkout your_feature_branch

# Squash Commits with Interactive Rebase
git rebase -i HEAD~n

# Squash Commits and Edit Commit Message
Update the rebase file, save, and continue the rebase:

git rebase --continue

# Force Push the Squashed Commit
git push origin your_feature_branch --force
```
## Create a Pull Request on GitHub

-  Many Git graphical user interfaces (GUIs) and platforms like GitHub and GitLab offer a squash merge option during the merge process. 
-  This is a convenient way to squash commits without using command-line commands.

Steps (General):

-  Initiate a merge: Go to the merge request or pull request interface for the branch you want to merge (e.g., git).
-  Look for the squash option: Locate a checkbox or dropdown menu labeled "Squash commits" or similar.
-  Select the squash option: Check the box or select the squash option.
-  Edit commit message (optional): Some platforms allow you to edit the squash commit message directly in the interface.
-  Complete the merge: Click the "Merge" or "Squash and Merge" button to finalize the squash merge.
-  Important: Exercise caution with force pushes (--force) as they rewrite history.

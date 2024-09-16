# Git File Tracking Guide

By following this guide, you can:

1. View which files are currently being tracked by Git.
2. Add files to .gitignore to prevent Git from tracking them.
3. Remove files already tracked by Git and stop Git from tracking them in future commits.

## 1. **Viewing Tracked Files in Git**

To see which files are currently being tracked by Git, use the following commands:

### **Check Git Status**
```
git status
```
This command shows the state of your working directory and staging area

### List Tracked Files
```

git ls-files
```
This command shows the files that are being tracked in the current Git repository. It lists all files that are included in the repository.

## 2. Adding Files to .gitignore
### Create or Edit .gitignore
Add files or directories to .gitignore to prevent Git from tracking them in the future. The .gitignore file should be in the root directory of your repository.

```

# Example .gitignore entries
*.log             # Ignore all .log files
node_modules/     # Ignore node_modules directory
*.env             # Ignore all .env files
```
### 3. Removing Files Already Tracked by Git Before Adding to .gitignore
If you have files that were already tracked by Git but you want to stop tracking them and add them to .gitignore, follow these steps:

#### Step 1: Add Files to .gitignore
Edit or create a .gitignore file and add the files or directories you want to stop tracking.

```

# Example .gitignore entries
logs/             # Ignore the 'logs' directory
config/settings.json  # Ignore a specific file
```
#### Step 2: Remove Tracked Files from Git
To stop tracking files that were previously tracked by Git (before they were added to .gitignore), use the git rm --cached command.

Command to Remove Tracked Files
```

git rm --cached <file_path>
```
This command removes the file from the staging area (index), but keeps it in your working directory.

For example, to remove all tracked files that are now in .gitignore:

```

git rm -r --cached .
-r: Recursively remove files.
--cached: Only remove files from Git’s tracking, not the actual files in the working directory.
.: Refers to the current directory and all subdirectories.
```

## Check If a File Is Ignored
To confirm if a file is properly ignored by .gitignore, use:

```

git check-ignore -v <file_path>
```
This will show whether a file is ignored and which .gitignore rule is causing it to be ignored.


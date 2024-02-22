# Git Operations and Issue Resolution

## Git Divergent Branches Issue

When you encounter the error "You have divergent branches and need to specify how to reconcile them" during a Git pull, follow these steps:

### Step 1: Choose a Reconciliation Method

Git suggests three methods for reconciling divergent branches. Choose one:

- **Merge (Default):**
```
git config pull.rebase false  # merge
```
- **Rebase:**
```
git config pull.rebase true   # rebase
```
- **Fast-forward Only:**
```
git config pull.ff only       # fast-forward only
```
### Step 2: Configure Local Repository (If Not Setting Global Configuration)
Configure the local repository directly if you don't want to set a global configuration. 

Execute one of the following based on your choice from Step 1:

For Merge:
```
git config pull.rebase false  # merge
```
For Rebase:
```
git config pull.rebase true   # rebase
```
For Fast-forward Only:
```
git config pull.ff only       # fast-forward only

```
### Step 3: Override Default Preference Per Invocation (Optional)
You can override the configured default by passing flags on the command line for each pull:
```
--rebase: Override with rebase.
--no-rebase: Override with merge.
--ff-only: Override with fast-forward only.
```
### Step 4: Execute Git Pull with Chosen Configuration
Choose the configuration from Step 1 or 2 that suits your needs and perform the pull:

For Merge:
```
git pull
```
For Rebase:
```
git pull --rebase
```
For Fast-forward Only:
```
git pull --ff-only
```
### Step 5: Handle Commit Message (If Prompted)
After pulling, Git may open an editor for a commit message. 

Follow the instructions based on your text editor. For example, in Vim:
```
Press i to enter insert mode.
Type your commit message.
Press Esc to exit insert mode.
Type :wq and press Enter to save and exit.
```
Congratulations! You've resolved the Git divergent branches issue.

### Additional Git Commands for Working with Remote Branches
List remote branches:


```
git branch -r
```
See the difference between local and remote branches:


```
git diff <local branch>..origin/<remote repo>/<remote repo branch>
```
Visualize local and remote branch changes:


```
git log --graph --oneline --all
```
See the log of changes in the remote repo that have been fetched:


```
git log origin/<remote repo branch>
```

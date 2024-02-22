# **Additional Git Commands and Extra Information**
## Git Garbage Collection (git gc)
Overview:
```
Git GC is typically run automatically in the background by Git.
Manually invoke it if necessary.
Removes unreferenced or unreachable objects, optimizing the repository.
```
Command:


```
git gc
```
## Aggressive Garbage Collection:


```
git gc --aggressive
```
Enables a more thorough garbage collection process.

Can potentially further optimize the repository.
## Git Clean
Overview:
```
Removes untracked files from the working directory.
Useful for cleaning up the workspace.
```
Commands:
```
git clean: Removes untracked files, excluding directories.
git clean -f: Force deletion of untracked files, including directories.
git clean -n: Dry run; preview files to be deleted without actual deletion.
```
## Git File System Check (git fsck)
Overview:
```
Performs a file system check on the Git repository.
Verifies integrity and identifies issues or inconsistencies.
```
Command:

```
git fsck
```
## Git Prune
Overview:
```
Removes unreachable or unused objects from the repository.
Optimizes the repository by freeing up space.
```
Command:


```
git prune
```
## Extra Theory on Git
Internal Object Database:
```
Git's data model relies on the internal object database.
Objects stored: Blobs (file content), Trees (directory structure), Commits (snapshot), Tags (named reference to commit).
Managed by Git in the .git/objects directory.
```
Git Objects:
```
Blob: Represents file content.
Tree: Represents a directory with references to blobs and trees.
Commit: Snapshot of the repository at a specific time.
Tag: Named reference to a specific commit.
```
## Running git fsck:

Checks integrity, verifies reachability of objects, and ensures data consistency.

Object references are crucial for navigation in Git's history.

Object References:
```
Established by branches, tags, or commits.
Branches, tags, or commits point to specific objects in the repository's history.
Facilitates navigation, switching between branches, accessing specific commits, or marking important points in development.
```

## Note: 
```
The provided commands and information offer insights into Git maintenance tasks, cleaning, and optimizing repositories.
They should be used judiciously based on specific needs rather than as part of routine daily maintenance.
```

# Version Control System

## Introduction
Version control system, also known as version control or source control, is a fundamental concept in software development. It addresses two major problems: sharing of code and versioning.

### Sharing
In a team working on a project, multiple developers make changes to different parts of the code. To combine their work and build a common application, they need a way to share their code efficiently.

### Versioning
During the development process, code undergoes changes and iterations. It is crucial to keep track of different versions of the code to enable easy collaboration, rollbacks, and bug fixes.

## Centralized vs. Distributed Version Control Systems

### Centralized Version Control System (CVCS)
In the past, systems like CVS and SVN were popular. They used a central server as the repository, and developers had to communicate with the server to share code. If the central server went down, it disrupted collaboration.

### Distributed Version Control System (DVCS)
Git, being a DVCS, allows developers to create multiple copies (forks) of the repository, enabling decentralized collaboration. Each developer has a complete copy of the code repository, including its full history. This redundancy minimizes the impact of server downtime and enhances collaboration and flexibility.

## Git and GitHub

### Git
Git is a distributed version control system (DVCS) that has gained popularity due to its effectiveness and efficiency in managing code repositories. It allows developers to track changes, collaborate on projects, and manage versions of their code locally.

### GitHub
GitHub is a web-based hosting service that provides a platform for developers to store and manage their Git repositories remotely. While Git is the underlying technology, GitHub adds a user-friendly interface, collaboration features, issue tracking, and project management capabilities to enhance the development workflow.

## Why Version Control System is Popular

### Code Sharing Problem
In a team, when developers are working on the same project, they need to share their code with each other. Traditional methods like email or chat applications are not efficient when dealing with numerous files and dependencies.

### Versioning Problem
Developers need the ability to track and manage different versions of the code. This is important for rolling back changes, comparing versions, and collaborating on different features.

## Git Workflow

### Initializing a Repository
To create a Git repository, you need to install Git on your system. Visit the official Git website (git-scm.com) and download the appropriate version for your operating system. Once installed, you can use Git commands in the terminal or command prompt. To initialize a Git repository for your project, navigate to the project's directory in the terminal and run the command "git init". This creates a hidden .git directory that tracks changes and versions of your code.

### Git Commands and Workflow
Git provides a set of commands for managing a repository's history, branches, commits, and more. Some commonly used commands include:
- git add: Add changes to the staging area before committing them.
- git commit: Create a new commit to record changes.
- git push: Upload local commits to a remote repository (e.g., GitHub).
- git pull: Download and integrate changes from a remote repository.
- git branch: Create, list, or delete branches.
- git merge: Combine changes from different branches.
- git clone: Create a local copy of a remote repository.
The typical Git workflow involves:
1. Initializing a repository with git init.
2. Adding files to the staging area using git add.
3. Committing changes with git commit to create a new version.


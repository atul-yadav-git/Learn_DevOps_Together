# Enabling Git Autocompletion on CentOS Stream 8

-  This document provides a step-by-step guide to enable autocompletion for Git commands in your CentOS Stream 8 terminal.
-  Autocompletion enhances your efficiency by quickly completing Git commands and options as you type.

## Prerequisites:

Ensure you have the following prerequisites before proceeding:

- CentOS Stream 8 system with Git installed (verify with `git --version`).

## Steps:

### 1. Locate the Git Completion Script

The Git completion script may be in one of two locations. Check both:

- **System-wide installation:**
  - `/etc/bash_completion.d/git` or
  - `/usr/share/bash-completion/completions/git`

- **User-specific installation (less likely):**
  - `~/.git-completion.bash` (expands to `/home/username/.git-completion.bash`)

Use the `ls` command to check each location. The output should display the filename (git) if the script exists.

### 2. (Optional) Install bash-completion Package

If the script is not found, you can install the `bash-completion` package using your system's package manager:

- **yum:**
  ```bash
  sudo yum install bash-completion
- **dnf:**
  ```bash
  sudo dnf install bash-completion
  ```
This ensures the script is available system-wide.

### 3. Edit Your Shell Profile
  Open your shell profile file (e.g., .bashrc or .zshrc) for editing using a text editor like nano or vim:

  ```bash
  nano ~/.bashrc  # Or replace with .zshrc if applicable
  ```
### 4. Add the Script Source Line
  At the end of the file, add the following line:

  ```bash
  source /usr/share/bash-completion/completions/git
  ```
  This line instructs your shell to source the completion script from the system-wide location.

### 5. Save and Close the File
  Save the changes made to your shell profile and close the text editor.

### 6. Restart Your Terminal (or Source the Profile)
  Choose one of the following options:

  `Restart`:
  Close the current terminal window and open a new one.

  `Source the Profile`:
  If you prefer to keep the current window open, run the following command:

  ```bash
  source ~/.bashrc  # Or replace with .zshrc if applicable
  ```
### 7. Test Autocompletion
  To confirm the autocompletion is working:
  ```
  # Type git followed by a space in your terminal.
  # Press the Tab key.
  ```
  You should see a list of Git commands for autocompletion.

## Additional Notes:
-  If you encounter issues with autocompletion after a restart, try sourcing the profile again using source ~/.bashrc (or .zshrc).
-  This document assumes you already have Git installed. Refer to the Git documentation for installation instructions if needed.

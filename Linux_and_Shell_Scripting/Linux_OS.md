# Understanding Linux Operating System

## Overview of Operating System
```
An operating system (OS) serves as a crucial link between hardware components and software applications.

When acquiring a device, the hardware is obtained, and the OS facilitates communication between software and hardware, allowing the installation and execution of software applications.
```
## Why Linux Operating System is Preferred
1. **Open Source Nature:**
   - Linux is a free and open-source OS, contrasting with the proprietary Windows OS from Microsoft.

2. **Security Features:**
   - Linux is recognized for its security, eliminating the need for additional antivirus software common in Windows environments.

3. **Diverse Distributions:**
   - Various Linux distributions (e.g., Ubuntu, CentOS, Debian) accommodate different user preferences.

4. **Speed and Reliability:**
   - Linux is known for its speed and reliability, making it well-suited for production systems.

## Components of the Linux Operating System
1. **Kernel:**
   - The core of Linux, managing devices, memory, processes, and system calls.

2. **System Libraries:**
   - Libraries facilitating specific tasks and providing interfaces between applications and the kernel.

3. **Compilers:**
   - Tools for compiling code written in languages like Java or Python.

4. **User Processes:**
   - Applications or software installed by users for specific tasks.

5. **System Software:**
   - Additional software and utilities supporting the operating system's functionality.

- `nproc`: Shows the number of CPUs.
- `df`: Displays disk space usage information.
- `top`: Monitors system performance, including CPU, memory, and disk usage.

## By utilizing these commands, common tasks such as file manipulation, system performance checking, and system status monitoring can be efficiently performed in a Linux environment.


## Creating and Removing Files/Directories
- Create a directory: `mkdir <directory_name>`.
- Remove a file: `rm <file_name>`.
- Remove a directory (including contents): `rm -r <directory_name>`.

## Checking System Performance
- Check memory usage: `free -m`.
- Check the number of CPUs: `nproc`.
- Check disk usage: `df -h` (displays disk space usage in a human-readable format).

## Monitoring System Status
- Use the `top` command to get an overview of CPU, memory, and disk usage in one place.
- Monitor CPU and memory percentages to assess system performance.

## Key Shell Commands for System Management
- `mkdir`: Creates a new directory.
- `rm`: Removes a file or directory.
- `free`: Displays memory usage information.

# **Fundamentals of Shell Scripting**
```
Shell scripting is a means of interacting with the operating system through command-line instructions.

The shell serves as an interface, enabling users to execute commands and perform various tasks.
```

# Bash Scripting

## 1. Bash scripting overview:
```
Bash (Bourne Again Shell) is a popular Unix shell and scripting language.

Bash scripts are plain text files containing a series of commands executed in sequence.

They are used to automate repetitive tasks and perform complex operations.
```
## 2. Creating and running scripts:
```
Create a new bash script by starting with the shebang (#!/bin/bash) to specify the interpreter.

Make the script executable using the chmod +x script.sh command.

Run a bash script using the bash script.sh or ./script.sh command.
```
## 3. Variables and data types:
```
Variables store data and can be assigned values using the = operator.

Use variable=value to declare and assign a value to a variable.

Common data types include strings, integers, and arrays.
```
## 4. Command substitution and arithmetic operations:
```
Use $(command) or backticks \`command\` to substitute the output of a command.

Perform arithmetic operations using $((expression)) or let command.
```
## 5. Input and output:
```
Accept user input with the read command.

Display output using the echo command or redirect with >, >>, and 2> for stdout, appending, and stderr respectively.
```
## 6. Conditional statements:

Use if statements for conditional branching.

```
if condition
then
    commands
elif condition
then
    commands
else
    commands
fi
```
Operators include -eq, -ne, -lt, -le, -gt, -ge for numeric comparisons, and -z, -n, =, != for string comparisons.

## 7. Looping constructs:
for loop:
```
for variable in list
do
    commands
done
```
while loop:
```
while condition
do
    commands
done
```
until loop:
```
until condition
do
    commands
done
```
## 8. Functions:
```
Functions are reusable code blocks defined using function_name() { commands }.

Call functions by using function_name.
```
## 9. Script arguments and parameters:
```
Access command-line arguments using $1, $2, etc., where $1 represents the first argument.

The $0 variable stores the script name itself.

$@ refers to all the command-line arguments passed.

$# returns the total number of arguments.
```
## 10. File handling:

```
Use commands like touch, rm, cp, mv, ls, cat, grep, and sed to work with files.

Redirect input and output using <, >, >>, 2>, |, and &.
```
## 11. Error handling:
```
Use exit to terminate the script.

Handle errors with if statements and return appropriate exit codes (0 for success, non-zero for failure).
```
## 12. Advanced topics:
```
Regular expressions: Use grep and sed with regex patterns to search and manipulate text.

Script debugging: Add set -x to enable debugging mode.

case statement: Perform multi-way branching based on values.

Arrays: Store multiple values in an array and perform operations on them.
```

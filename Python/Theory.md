# 1. Introduction to Python

Python is case-sensitive and executes code with a .py extension.

Python is an interpreted language. The compiler translates high-level code to machine code. It's easy to write and read.

## 2. Print Function
```
print("atul")  # function("arguments")
```
### Functions

A part of your code that’s used to cause an effect or evaluate a value. Functions can come from:
```
-  Python (built-in functions)
-  Modules
-  Your own functions
```
### Function Execution Flow
```
1. Check function name
2. Check arguments passed
3. Jumps into function
4. Executes the function
5. Returns to your code
6. Resumes execution
```
### print() Function
```
  - Built-in function; can be used without importing.
  - Allows printing values to consoles.
  - Invoked with parentheses.
  - Values to print are passed as arguments between the parentheses.
  - The backslash \ indicates that the next character has a special meaning (e.g., \n).
  - Keyword arguments such as sep and end can be used for formatting.
```
## 3. Literals
Literals are specific values, not variables.
![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/6aff8a02-bddf-4bf8-a0ec-7dfc834c56f2)


## 4. Operators
In Python, operations between integers give an integer, but operations between an integer and a float return a float.
```
Arithmetic Operators
Addition +
Subtraction -
Multiplication *
Division /
Floor Divide //
Modulo (remainder) %
Exponential **
```

### Operator Priority
```
Priority: Exponential, Multiply/Divide, Add/Subtract. When of the same priority, left to right. Parentheses () can be used for specific priority.
```
Divide operator always returns a float value, even if both operands are integers. Use floor divide for an integer result.
## 5. Variables
```
Variables allow you to store values. 

A variable has a valid name (letters, digits, underscore; not a special character). 

Variables can be redeclared using upper and lower case. 

Shortcut operators can be used for clean redeclaration.
```
![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/7ea28187-4714-4af2-9bc3-b8c0dab7d9cf)

## 6. Comments
```
Comments allow you to add information for humans to your code.

A comment is created by # followed by text.

A multi-line comment should have # in front of every line.

Don’t write unnecessary comments; write self-documenting code instead.
```
## 7. Input Function

```
input("Optional message before user input: ")
Prompts the user to input data from the console. Always returns a string datatype. A program that doesn’t use any input function is called a deaf function.
```
## 8. String Operations

```
str1 = "Hello"
str2 = "World"

str_concatenated = str1 + str2
str_repeated = str1 * 3
str_typecasted = str(123)
```
## 9. Comparison Operators
Comparison operators are very useful when you want to run code based on a certain condition.
```
== (equal to)
!= (not equal to)
> (greater than)
>= (greater than or equal to)
< (less than)
<= (less than or equal to)
```
They give a boolean output as true or false.

## 10. Control Flow: Conditional Blocks and Loops
### 10.1 Conditional Statements: if

```
if condition is true:
    print("The condition is true")
elif second condition is true:
    print('Only the 2nd condition is true')
else:
    print('Both conditions are false')
```
Indentation error if tab and syntax not properly followed.

### 10.2 Loops: while Conditions

```
while condition is true:
    # Inside code is executed
else:
    # This code is executed
```
else can be used in while. Use break to exit loops.

### 10.3 Loops: for
Loops are used to repeat code until a condition or value is matched.

```
for i in range(5):
    print("i is:", i)
```
Objects of type int are not iterable; use a list, dictionary, or tuple.

## 11. Logic and Bit Operations
```
Logical Operators: and, or, not
and: False if any one is false.
or: True if at least one is true.
not: Inverted.
Bitwise Operators: &, |, ^, ~
```
Operators manipulate single bits. &: conjunction, |: disjunction, ~: negation, ^: exclusive.
![image](https://github.com/atul-yadav-git/Learn_DevOps_Together/assets/103098829/32ca79c4-40c7-4f18-9f93-c70e30b3b5af)

## 12. Lists

```
my_list = [0, 1, 2]
my_list_negative = [-3, -2, -1]
my_list[1] = 10
```
## 13. List Methods
Methods are specific types of functions owned by the data it works for.
```
list.append(value): Adds a new value at the end of the list.
list.insert(index, value): Inserts a new value where needed.
list.sort(): Sorts arrays in ascending order.
list.reverse(): Reverses the values in the list.
Slicing list: list[:], list[0:last-1]. Finding elements in the list: print("value" in list).
```
## 14. Functions

```
def function_name():
    # Function body
```
## 15. Function Arguments
Pass parameters to functions. Use * for a variable number of arguments.


```
def input_no(num):
    return int(input('Enter no')) * num

def my_function(*argv):
    # Function body
```
## 16. Return Statement
Gives more control over how a function executes and ends. By default, if no value is mentioned, Python returns None.

## 17. Passing List as Argument to Functions

```
def funct(my_list):
    multiply = []
    # Function body
```
## 18. Scopes
Global variables and function variables. Variables defined inside a function have function scope. Variables defined outside have global scope. Even inside a function, we can type global in front of a variable to give it global scope.

## 19. Tuples

```
tuple1 = (1, 2, 3)
tuple2 = 1, 2, 3
```
A tuple is an immutable datatype. Its data cannot be modified. A tuple is a collection of items that are ordered, unchangeable, and allow duplicate values.

## 20. Dictionaries in Python

```
dictionary = {"key": "value", "key2": "value2"}
```
There are three methods to read the data:
```
dictionary.keys(): Gives all keys.
dictionary.values(): Gives all values.
dictionary.items(): Gives key-value pairs.
Other methods include dictionary.clear(), dictionary.update(), and dictionary.popitem().
```
## 21. Errors and Exceptions
Handle errors with try and except keywords.


```
try:
    # Code block
except:
    # Code block
```
Named exceptions in Python can be used, and unnamed exceptions should be given in the last except. Use the raise keyword to manually raise exceptions.

## 22. Hierarchy of Exceptions
Python3 has 63 built-in exceptions forming a tree hierarchy from general to specific.


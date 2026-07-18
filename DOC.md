# Gaba Programming Language Documentation

## Introduction

Gaba is a simple interpreted programming language designed for learning programming and building console applications. It provides variables, arithmetic, conditions, loops, functions, lists, maps, modules, and native functions.

---

# VERSION 1.3.6

# Hello World

```gaba
say("Hello, World!")
```

Output:

```
Hello, World!
```

---

# Variables

Use `let` to declare variables.

```gaba
let name = "John"
let age = 20
let pi = 3.14
let isStudent = true
```

Use `set` to declare variables.

```gaba
set name = "John"
set age = 20
set pi = 3.14
set isStudent = true
```

Print variables using `say()`.

```gaba
say(name)
say(age)
```

---

# Data Types

| Type    | Example          |
| ------- | ---------------- |
| Integer | `10`             |
| Float   | `3.14`           |
| String  | `"Hello"`        |
| Boolean | `true`           |
| List    | `[1,2,3]`        |
| Map     | `{"name":"Ali"}` |

---

# Comments

Single-line comments:

```gaba
// This is a comment
```
Multi line comments
```gaba
/* This is a comment*/
```

---

# Printing Output

Use `say()`.

```gaba
say("Hello")
say(100)
say(true)
```

---

# User Input

Use `ask()`.

```gaba
let name = ask("Enter your name: ")

say(name)
```

Since `ask()` always returns a string, convert it when needed.

```gaba
let age = int(ask("Age: "))
let salary = float(ask("Salary: "))
```

---

# Native Functions

## int()

Convert a value to an integer.

```gaba
let age = int("25")

say(age)
```

---

## float()

Convert to floating point.

```gaba
let price = float("99.5")

say(price)
```

---

## str()

Convert to string.

```gaba
let text = str(123)

say(text)
```

---

## bool()

Convert to boolean.

```gaba
let value = bool("true")

say(value)
```

---

# Arithmetic Operators

| Operator | Meaning        |
| -------- | -------------- |
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |

Example:

```gaba
let a = 10
let b = 3

say(a + b)
say(a - b)
say(a * b)
say(a / b)
say(a % b)
```

---

# Comparison Operators

| Operator | Meaning               |
| -------- | --------------------- |
| ==       | Equal                 |
| !=       | Not Equal             |
| >        | Greater Than          |
| >=       | Greater Than or Equal |
| <        | Less Than             |
| <=       | Less Than or Equal    |

Example:

```gaba
say(5 == 5)
say(5 != 3)
say(10 > 4)
say(3 <= 4)
```

---

# If Statement

```gaba
let age = 20

if age >= 18 {
    say("Adult")
}
```

---

# If-Else

```gaba
let age = 15

if age >= 18 {
    say("Adult")
} else {
    say("Minor")
}
```

---

# While Loop

```gaba
let i = 1

while i <= 5 {
    say(i)

    i = i + 1
}
```

Output:

```
1
2
3
4
5
```

---

# For Loop

Example:

```gaba
for let iii = 0, iii < 5, iii = iii + 1 {
    say(iii)
}
```

---
# Stop

both loops for and while now support stop which is act like break in other languages and here is example :

```gaba
let i = 1

while true {

    say(i)

    if i == 5 {
        stop
    }

    i = i + 1
}

say("Finished")
```
Output 

1
2
3
4
5
Finished


---

# Skip

both loops for and while now support skip which is act like CONTINUE in other languages and here is example :

```gaba
let i = 0

while i < 5 {

    i = i + 1

    if i == 3 {
        skip
    }

    say(i)
}
```
Output 

1
2
4
5

---

```gaba
while true {

    let option = int(ask("Option: "))

    if option == 0 {
        stop
    }

    if option < 0 {
        skip
    }

    say(option)
}
```

---

# Functions

Declare a function using `fun`.

```gaba
fun greet(name) {
    say("Hello")
    say(name)
}
```

Call it.

```gaba
greet("John")
```

---

# Returning Values

Use `give`.

```gaba
fun add(a,b) {
    give a + b
}

let result = add(5,10)

say(result)
```

---

# Lists

Create a list.

```gaba
let numbers = [1,2,3]
```

Print it.

```gaba
say(numbers)
```

---

# List Indexing

```gaba
let numbers = [10,20,30]

say(numbers[0])
say(numbers[1])
```

Output:

```
10
20
```

---

# Updating a List

```gaba
let numbers = [10,20,30]

numbers[1] = 99

say(numbers)
```

Output:

```
[10,99,30]
```

---

# List Methods

## push()

```gaba
numbers~push(40)
```

Adds an item to the end.

---

## pop()

```gaba
numbers~pop()
```

Removes the last item.

---

## len()

```gaba
say(numbers~len())
```

Returns list length.

---

## contains()

```gaba
say(numbers~contains(20))
```

Returns true if the value exists.

---

## insert()

```gaba
numbers~insert(1,50)
```

Insert at an index.

---

## removeAt()

```gaba
numbers~removeAt(2)
```

Removes an item at an index.

---

## clear()

```gaba
numbers~clear()
```

Removes every item.

---

## isEmpty()

```gaba
say(numbers~isEmpty())
```

Returns true if empty.

---

# Maps

Maps store key-value pairs.

```gaba
let product = {
    "name": "Laptop",
    "price": 50000,
    "stock": 10
}
```

Print a map.

```gaba
say(product)
```

---

# Access Map Values

```gaba
say(product["name"])
say(product["price"])
```

---

# Update Map Values

```gaba
product["stock"] = 5

say(product)
```

---

# Map Methods

## len()

```gaba
say(product~len())
```

Returns number of entries.

---

## keys()

```gaba
say(product~keys())
```

Returns all keys.

---

## values()

```gaba
say(product~values())
```

Returns all values.

---

## containsKey()

```gaba
say(product~containsKey("price"))
```

Returns true if the key exists.

---

## containsValue()

```gaba
say(product~containsValue(50000))
```

Returns true if the value exists.

---

## remove()

```gaba
product~remove("price")
```

Removes an entry by key.

---

## clear()

```gaba
product~clear()
```

Removes all entries.

---

## isEmpty()

```gaba
say(product~isEmpty())
```

Returns true if the map is empty.

---

# Modules

Import a module.

```gaba
import "math"
```

Call a module function.

```gaba
say(math.add(5,10))
```

Modules use the **dot (`.`)** operator.

---

# Methods vs Modules

Methods use **`~`**

```gaba
numbers~push(10)
product~keys()
```

Modules use **`.`**

```gaba
math.add(10,20)
```

---

# Example Program

```gaba
let products = []

let product = {
    "name": "Laptop",
    "price": 50000,
    "stock": 10
}

products~push(product)

for item in products {
    say(item["name"])
    say(item["price"])
    say(item["stock"])
}
```

Output:

```
Laptop
50000
10
```

---

# Language Summary

### Keywords

* `let`
* `if`
* `else`
* `while`
* `for`
* `fun`
* `give`
* `import`
* `say`
* `ask`

### Operators

Arithmetic:

```
+
-
*
/
%
```

Comparison:

```
==
!=
>
<
>=
<=
```

### Collections

* Lists (`[]`)
* Maps (`{}`)

### Access

```
list[index]
map["key"]
```

### Assignment

```
list[index] = value
map["key"] = value
```

### Methods

```
~
```

Example:

```gaba
numbers~push(5)
product~keys()
```

### Modules

```
.
```

Example:

```gaba
math.add(5,10)
```

Congratulations! You now know the core features of the Gaba programming language and can build interactive console applications such as calculators, inventory systems, student management systems, and more.

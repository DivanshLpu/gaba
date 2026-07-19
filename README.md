# Gaba Installation Guide

Gaba can be installed on **Linux**, **macOS**, and **Windows** using a single command.

---

# Linux

Install the latest version:

```bash
curl -fsSL https://raw.githubusercontent.com/DivanshLpu/gaba/main/install.sh | bash
```

Uninstall:

```bash
curl -fsSL https://raw.githubusercontent.com/DivanshLpu/gaba/main/uninstall.sh | bash
```

---

# macOS

Install the latest version:

```bash
curl -fsSL https://raw.githubusercontent.com/DivanshLpu/gaba/main/install.sh | bash
```

Uninstall:

```bash
curl -fsSL https://raw.githubusercontent.com/DivanshLpu/gaba/main/uninstall.sh | bash
```

---

# Windows (PowerShell)

Install:

```powershell
irm https://raw.githubusercontent.com/DivanshLpu/gaba/main/install.ps1 | iex
```

Uninstall:

```powershell
irm https://raw.githubusercontent.com/DivanshLpu/gaba/main/uninstall.ps1 | iex
```

---

# Windows (Command Prompt)

Install:

```cmd
curl -fsSL https://raw.githubusercontent.com/DivanshLpu/gaba/main/install.bat -o install.bat && install.bat
```

Uninstall:

```cmd
curl -fsSL https://raw.githubusercontent.com/DivanshLpu/gaba/main/uninstall.bat -o uninstall.bat && uninstall.bat
```

---

# Verify Installation

After installation, verify that Gaba is installed correctly:

```bash
gaba version
```

or

```bash
gaba
```

---

# Installation Locations

Depending on your operating system, Gaba is installed to:

| Operating System | Installation Path |
|------------------|-------------------|
| Linux | `~/.local/bin/gaba` |
| macOS | `~/.local/bin/gaba` |
| Windows | `%LOCALAPPDATA%\Programs\gaba\gaba.exe` |

---

# Troubleshooting

### Linux/macOS

If the `gaba` command is not found after installation, add the following to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Then reload your shell:

```bash
source ~/.bashrc
```

or

```bash
source ~/.zshrc
```

---

### Windows

If `gaba` is not recognized after installation, restart your terminal or open a new Command Prompt/PowerShell window.

---

# Gaba Programming Language

> **A simple interpreted programming language written in Dart.**

Gaba is a hobby project where I'm building my own programming language from scratch to better understand how programming languages, interpreters, parsers, lexers, and runtimes work internally.

This project is not intended to compete with existing languages. Instead, it is a learning journey and an opportunity to experiment with language design while gradually adding features found in modern programming languages.

> **⚠️ Gaba is currently under active development. New language features, syntax improvements, and standard library modules are being added regularly.**

---

# Why I Started This Project

I've always been curious about how programming languages actually work behind the scenes.

Instead of only using existing languages, I wanted to understand how they are built—from converting source code into tokens, parsing those tokens into an Abstract Syntax Tree (AST), and finally interpreting and executing the program.

This repository documents that journey.

Every feature added to Gaba helps me learn more about:

* Language design
* Compiler and interpreter concepts
* Parsing techniques
* Runtime environments
* Data structures
* Error handling
* Standard library design

---

# About Gaba

Gaba is a small interpreted programming language that currently focuses on being:

* Simple
* Easy to read
* Beginner friendly
* Fun to experiment with
* Easy to extend

The interpreter is written entirely in **Dart**.

---

# How Gaba Works

Like most interpreted languages, Gaba executes code through several stages.

```
Source Code
      │
      ▼
Lexer
(Tokenization)
      │
      ▼
Parser
(Abstract Syntax Tree)
      │
      ▼
Interpreter
(Runtime Execution)
      │
      ▼
Program Output
```

## 1. Lexer

The lexer reads the source code character by character and converts it into tokens.

Example:

```gaba
let age = 20
```

becomes something similar to:

```
LET
IDENTIFIER(age)
=
NUMBER(20)
```

---

## 2. Parser

The parser converts tokens into an Abstract Syntax Tree (AST).

Example:

```gaba
let age = 20
```

becomes something conceptually like:

```
VariableDeclaration
 ├── name: age
 └── value: 20
```

---

## 3. Interpreter

The interpreter walks through the AST and executes each statement one by one.

Unlike a compiler, Gaba currently executes programs directly without generating machine code.

---

# Current Features

## Variables

```gaba
let name = "John"
let age = 20
```

---

## Arithmetic

```gaba
say(5 + 5)
say(10 - 3)
say(8 * 2)
say(20 / 4)
```

---

## Comparisons

```gaba
==
!=
>
<
>=
<=
```

---

## Conditional Statements

```gaba
if age >= 18 {
    say("Adult")
} else if age >= 13 {
    say("Teen")
} else {
    say("Child")
}
```

---

## Loops

### While

```gaba
while true {
    say("Hello")
}
```

### For

```gaba
for number in numbers {
    say(number)
}
```

### Loop Control

```gaba
stop
```

Stops the nearest loop.

```gaba
skip
```

Skips the current iteration of the nearest loop.

---

## Functions

```gaba
fun add(a, b) {
    give a + b
}

say(add(5, 10))
```

---

## Native Functions

Built-in functions currently include:

* `say()`
* `ask()`
* `int()`
* `float()`
* `str()`
* `bool()`

Example:

```gaba
let age = int(ask("Age: "))
```

---

## Lists

```gaba
let numbers = [1,2,3]
```

Supported features:

* Indexing
* Assignment
* Push
* Pop
* Insert
* Remove
* Contains
* Length
* Clear
* isEmpty

---

## Maps

```gaba
let product = {
    "name": "Laptop",
    "price": 50000,
    "stock": 10
}
```

Supported features:

* Key access
* Assignment
* Keys
* Values
* Remove
* Contains key
* Contains value
* Length
* Clear
* isEmpty

---

## Modules

Modules can be imported and called using dot syntax.

```gaba
import "math"

say(math.add(5,10))
```

Object methods use the `~` operator.

```gaba
numbers~push(5)
product~keys()
```

---

# Project Structure

```
lib/
│
├── lexer.dart
├── parser.dart
├── interpreter.dart
├── runtime.dart
├── ast.dart
├── token.dart
├── token_type.dart
└── ...
```

Each file has a dedicated responsibility, making the interpreter easier to understand and extend.

---

# Current Development Status

The language is still under development.

The core interpreter is functional, but many planned features are still being implemented.

### Completed

* Variables
* Expressions
* Arithmetic
* Comparisons
* If / Else If / Else
* While loops
* For loops
* Loop control (`stop`, `skip`)
* Functions
* Return statements (`give`)
* Native functions
* Lists
* Maps
* List methods
* Map methods
* Indexing
* Assignment
* Module system
* Imports

### Planned

* String methods
* File I/O
* JSON support
* Random module
* Time module
* Error handling
* Package system
* Better standard library
* Additional optimizations

---

# Why Build Another Language?

This project exists because building a language is one of the best ways to understand how programming works internally.

It has taught me about:

* Parsing
* Lexical analysis
* AST design
* Runtime execution
* Language design
* Error reporting
* Scope management
* Data structures
* Interpreter architecture

Every new feature deepens my understanding of programming language implementation.

---

# Goals

The goal is not to replace existing languages.

The goal is to:

* Learn compiler and interpreter concepts.
* Build a clean and understandable language.
* Experiment with language features.
* Improve software design skills.
* Have fun creating something from scratch.

---

# Example

```gaba
fun greet(name) {
    say("Hello")
    say(name)
}

let user = ask("Your name: ")

greet(user)
```

---

# Contributing

Although this started as a personal hobby project, suggestions, bug reports, and constructive feedback are always welcome.

---

# License

FREEEEEEEEEE

---

## Final Note

Gaba is a personal learning project and is still evolving. Every new feature is designed, implemented, and tested as part of learning how programming languages work internally.

If you find this project interesting, feel free to explore the source code, try the language, or follow its progress as it continues to grow.

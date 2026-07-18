# Installing and Using Gaba

This guide explains how to install Gaba on your operating system and start writing your first Gaba program.

> **Note:** Gaba is currently under development. Installation steps and commands may change as the project evolves.

---

# Download Gaba

Go to the **Releases** section of this repository and download the ZIP file for your operating system.

Available downloads:

* **Windows** → `gaba-windows.zip`
* **Linux** → `gaba-linux.zip`
* **macOS** → `gaba-macos.zip`

Choose the package that matches your operating system.

---

# Extract the ZIP File

After downloading, extract the ZIP archive.

Inside the extracted folder, you will find the Gaba executable.

### Windows

```text
gaba.exe
```

### Linux / macOS

```text
gaba
```

---

# Linux and macOS

Before using Gaba, make the executable runnable.

Open a terminal in the extracted folder and run:

```bash
chmod +x gaba
```

This gives the executable permission to run.

---

# Add Gaba to Your PATH

Adding Gaba to your system's **PATH** allows you to use the `gaba` command from any directory.

## Windows

1. Copy `gaba.exe` to a permanent location (for example, `C:\Gaba`).
2. Open **Environment Variables**.
3. Edit the **Path** variable.
4. Add the folder containing `gaba.exe`.
5. Restart your terminal or Command Prompt.

---

## Linux

Move the executable to a directory already in your PATH.

Example:

```bash
sudo mv gaba /usr/local/bin/
```

Or add its current directory to your PATH in your shell configuration file (`.bashrc`, `.zshrc`, etc.).

---

## macOS

Move the executable to a directory in your PATH.

Example:

```bash
sudo mv gaba /usr/local/bin/
```

Or update your shell configuration to include the folder containing the executable.

---

# Verify Installation

Open a terminal and run:

```bash
gaba version
```

If Gaba is installed correctly, it will display the installed version.

---

# Gaba Commands

## Display Version

```bash
gaba version
```

Displays the current installed version of Gaba.

---

## Show Help

```bash
gaba help
```

Displays all available commands and usage information.

---

## Run a Program

```bash
gaba run filename.gaba
```

Example:

```bash
gaba run hello.gaba
```

---

# Your First Program

Create a file named **hello.gaba**

```gaba
say("Hello, World!")
```

Save the file and run:

```bash
gaba run hello.gaba
```

Output:

```text
Hello, World!
```

---

# Typical Workflow

Create a new project:

```text
MyProject/
│
├── main.gaba
├── math.gaba
└── utils.gaba
```

Run your application:

```bash
gaba run main.gaba
```

Check the installed version:

```bash
gaba version
```

Need help?

```bash
gaba help
```

---

# Troubleshooting

## Command not found

If you see:

```text
gaba: command not found
```

or

```text
'gaba' is not recognized as an internal or external command
```

make sure:

* Gaba has been added to your system PATH.
* The executable is named correctly.
* Your terminal has been restarted after updating the PATH.

---

## Permission denied (Linux/macOS)

If you see:

```text
Permission denied
```

run:

```bash
chmod +x gaba
```

and try again.

---

# Keeping Gaba Updated

When a new release is available:

1. Download the latest ZIP for your operating system.
2. Replace the old executable with the new one.
3. Verify the update:

```bash
gaba version
```

---

# Need Help?

If you encounter any issues, have suggestions, or find a bug, please open an issue in this repository. Feedback is always welcome as Gaba continues to evolve.

# AssilLoader

A simple, educational operating system loader and kernel starter for x86 systems, based on [antoninhrlt/bootos](https://github.com/antoninhrlt/bootos).

This project is part of the **[AssilOS Project](https://github.com/assilassilkerr-boop)** – a collection of operating system experiments and tools.

---

## 📋 Description

AssilLoader is a foundational bootloader that handles the low-level hardware initialization, allowing you to focus on writing your operating system's kernel in C. It performs the following tasks:

- **Switches the CPU** from 16-bit real mode to **32-bit protected mode**
- **Initializes the Global Descriptor Table (GDT)** for memory segmentation
- **Loads and executes your C kernel** at the memory address `0x1000`
- Supports both **x86 and x64** architectures

This project is designed for learning, experimentation, and as a stepping stone for more complex OS development.

---

## 🖥️ System Requirements

### Operating System Support
AssilLoader can be built and run on the following operating systems:

| OS | Build Support | Run Support | Notes |
| :--- | :---: | :---: | :--- |
| **Linux** (Ubuntu, Debian, Fedora, etc.) | ✅ Yes | ✅ Yes | Native `gcc`, `make`, `nasm`, and `qemu` available via package managers. |
| **Windows** (7, 8, 10, 11) | ✅ Yes | ✅ Yes | Requires manual installation of development tools (see below). |
| **macOS** | ✅ Yes | ✅ Yes | Requires Xcode Command Line Tools and Homebrew for package installation. |
| **FreeBSD / OpenBSD** | ✅ Yes | ❌ Not Tested | May work with GNU tools, but QEMU availability may vary. |

### Required Tools (All Platforms)

| Tool | Version | Purpose |
| :--- | :---: | :--- |
| `make` | 3.81+ | Build automation |
| `gcc` | 4.8+ | C compiler (with `-ffreestanding` support) |
| `nasm` | 2.14+ | x86 assembler |
| `ld` | 2.30+ | GNU linker |
| `cat` | Any | File concatenation utility |
| `dd` | Any | Disk image creation utility |

### Optional Tools
- **`qemu-system-x86_64`** – For running the OS in an emulator (recommended for testing).
- **`git`** – For version control and cloning the repository.

---



"Every great OS starts with a single boot sector."

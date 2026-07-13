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

### 📦 Platform-Specific Installation

#### Linux (Debian/Ubuntu)
```bash
sudo apt update && sudo apt install -y build-essential nasm qemu-system-x86 make
Linux (Fedora)
bash
sudo dnf install -y gcc nasm qemu-system-x86 make
Windows (Using GnuWin32 & MinGW)
Install GnuWin32:

Download and install make and coreutils from the GnuWin32 project.

Add C:\Program Files (x86)\GnuWin32\bin to your PATH.

Install NASM:

Download the Windows installer from nasm.us.

Add its installation folder (e.g., C:\Program Files\NASM) to your PATH.

Install MinGW for GCC:

Download and install MinGW.

Ensure gcc and ld are installed and added to your PATH.

Install QEMU:

Download the Windows version from qemu.weilnetz.de.

Note on dd: The GnuWin32 version of dd may not support /dev/zero. Replace it with a version from John Newbigin's dd for Windows or use an alternative padding method.

macOS (Using Homebrew)
bash
brew install gcc nasm qemu make
🚀 Quick Start
1. Set Up Your Project
bash
# Clone the bootloader base
git clone https://github.com/antoninhrlt/bootos bootos

# Your project structure should look like this:
# AssilLoader/
# ├── bootos/
# ├── src/
# │   └── kernel.c
# └── Makefile
2. Write Your Kernel (src/kernel.c)
c
// src/kernel.c
void kmain() {
    char* video_memory = (char*) 0xB8000;
    const char message[] = "AssilLoader v0.1 - Welcome!";
    int i = 0;

    while (message[i] != '\0') {
        video_memory[i * 2] = message[i];
        video_memory[i * 2 + 1] = 0x07;
        i++;
    }

    while(1); // Halt the CPU
}
3. Build and Run
bash
make all        # Build the complete OS image
make emu        # Run in QEMU emulator

📁 Project Structure
text
AssilLoader/
├── bootos/              # Bootloader base (from antoninhrlt)
│   ├── src/
│   │   ├── bootsect.asm
│   │   ├── defs.inc
│   │   ├── gdt.asm
│   │   └── print.asm
│   └── Makefile
├── src/                 # Your kernel source code
│   └── kernel.c         # Main kernel entry point
├── build/               # Compiled objects (auto-created)
├── LICENSE              # MIT License
├── README.md            # This file
└── Makefile             # Build automation
🔧 Build Commands
Command	Description
make all	Build the complete OS disk image (assiloader-image.bin).
make emu	Run the OS in QEMU.
make clean	Remove all build artifacts and clean the directory.
make dist	Create a distribution package with the binary and license.
⚠️ Disclaimer and Warning
THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT.

Educational Purpose Only: This project is intended for learning, experimentation, and personal use.

Not for Production: AssilLoader is not suitable for production environments, critical systems, or any use where reliability is required.

Potential for Damage: Running this software on real hardware may cause data loss, system instability, or hardware damage. You assume all risks associated with running this software.

No Liability: The AssilOS Project and its contributors assume no responsibility or liability for any damages, losses, or legal issues arising from the use or misuse of this software.

Emulator Recommended: Always test this software in an emulator (like QEMU) before attempting to run it on physical hardware.

By using this software, you acknowledge that you have read this disclaimer and agree to accept all risks and responsibilities.

📚 Learning Resources
OSDev Wiki – The definitive resource for OS development.

Intel 64 and IA-32 Architectures Manuals – Official CPU documentation.

The Little OS Book – A beginner-friendly guide.

nanochess/bootOS – The original 512-byte OS, for inspiration.

🤝 Contributing
Contributions are welcome! Here's how you can help:

Report bugs or issues.

Suggest new features or improvements.

Submit pull requests with code changes.

Please ensure your contributions are well-documented and follow the existing coding style. By contributing, you agree to license your work under the same MIT License as this project.

📄 License
This project is licensed under the MIT License. See the LICENSE file for the full text.

Copyright (c) 2026 AssilOS Project – GitHub

🙏 Acknowledgements
antoninhrlt – Creator of the base bootloader (antoninhrlt/bootos).

nanochess – Creator of the original bootOS, which inspired this project.

The OS Development Community – For invaluable resources, forums, and support.

Part of the AssilOS Project – Built with ❤️ by Assil

"Every great OS starts with a single boot sector."
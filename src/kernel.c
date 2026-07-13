// SPDX-License-Identifier: MIT
// Copyright (c) 2026 AssilOS Project
// AssilLoader - A simple operating system loader

void kmain() {
    // Pointer to VGA text-mode video memory
    char* video_memory = (char*) 0xB8000;
    
    // Boot message
    const char message[] = "AssilLoader v0.1 - Welcome!";
    int i = 0;
    
    // Print the message
    while (message[i] != '\0') {
        video_memory[i * 2] = message[i];     // Character
        video_memory[i * 2 + 1] = 0x07;       // Light grey on black
        i++;
    }
    
    // Halt the CPU
    while(1);
}
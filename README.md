# diverter

Lightweight Ruby library for executing tasks in a seperate Ruby process

### Motivation

Ruby very rarely releases memory back to the operating system once allocated.
This gem realizes a neat trick as suggested by the Book "Ruby Performance Optimization" 
by Alexander Dymo: https://pragprog.com/book/adrpo/ruby-performance-optimization

The crucial point is that exiting a subprocess will force Ruby to release
all the memory allocated in the subprocess back to the OS.

### Changelog

#### 0.0.1

Initial version

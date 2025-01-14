# diverter

Lightweight Ruby library for executing tasks in a seperate Ruby subprocesses

### Motivation

Ruby very rarely releases memory back to the operating system once allocated.
This gem realizes a neat trick as suggested by the Book "Ruby Performance Optimization"
by [Alexander Dymo](https://github.com/adymo): https://pragprog.com/book/adrpo/ruby-performance-optimization

The crucial point is that exiting a subprocess will force Ruby to release
all the memory allocated in the subprocess back to the OS.

### Synopsis

```Ruby
class DecadentMemoryConsumer
  …

  # Needs a lot of memory
  # to execute some magical
  # task

  …
end

# If the predicate :memory_almost_exceeded? evaluates to true,
# the block will be executed in a forked subprocess
# that is forced to terminate afterwards
Diverter.new(condition: memory_almost_exceeded?) do
  DecadentMemoryConsumer.perform_memory_expensive_operation
end

# condition defaults to true, so this is equivalent of condition set to true
Diverter.new do
  DecadentMemoryConsumer.perform_memory_expensive_operation
end
```

### Changelog

#### 0.0.1

Initial version

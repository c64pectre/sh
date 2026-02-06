# sh

Commodore 64 Shell, based on the shell from Spinnaker Power C from 1986.

# Shell built-in commands

| Command | Description |
| :- | :- |
| `exit` | Exit shell. |
| `l` | List directory of work disk. Pause with SHIFT key. |
| `ls` | List directory of system disk. Pause with SHIFT key. |
| `mv FROM TO` | Move (rename) a file. |
| `pr FILE` | Print (cat, type) contents of a file. |
| `rm FILE` | Remove (delete or scratch) a file. |
| `disk COMMAND` | Send command to work disk. |
| `load PROGRAM` | Load, but do not execute, program. |
| `PROGRAM args...` | Load, if not already done so, and execute program. |
| `work DEVICE DRIVE` | Without arguments, show current work disk device and drive. With arguments: change work disk device and drive. Default: 8 and 0. |
| `sys DEVICE DRIVE` | Without arguments, show current system disk device and drive. With arguments: change system disk device and drive. Default: 8 and 0. |

You can use wild cards `?` (matching any one character) and `*` (matching zero or more characters).
Note that the built-in commands `mv`, `pr`, `rm`, `load` only act on the first matching file.

A program is a type PRG file with a file name extension ".sh", entrypoint at $1800, argc (word) and argv at the datasette/tape buffer $033C.

# Input and output redirection

Redirect input to a command (built-in or program) from a file with `<`:

    COMMAND < IN_FILE

Redirect output from a command to a file with '>':

    COMMAND > OUT_FILE

Redirect output from a command to the printer (device 4) with '>>':

    COMMAND >>

# Build tools

* PMP
* ca65
* ld65
* x64sc

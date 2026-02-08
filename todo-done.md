# TODO

# DONE Code in CA65 format from DA64

Disassemble the original `shell` program using the CC65 disassembler `da65`, so we have
source code in CC65 assembler (`ca65`) format.

# DONE Structured programming

Make procedures with `.proc` and `.endproc`.

Use the structured programming macros, like:

    if_cs_then
        ...
    else_end

# DONE Get rid of the too smart optimizations

Get rid of these optimizations that are not structured programming.

- The continuing in the next routine.
- The jumping into another routine.

# DONE Get rid of dead code and data.

Lot of routines that cannot be called from the entrypoint.

Ditto for data that can not be accessed from any routine accessable from the entrypoint.

# DONE Move read-only data to RODATA segment

Move read-only data, like strings to the RODATA segment.

# DONE Move read+write data to DATA segment.

Move read + write data, like the device & disk string, to the DATA segment.

# DONE Memory layout

Do not use program memory for storage, use available memory in KVAR ($0200-$03FF)

Do not use those zero page locations, use AX-DX.

We can use these memory areas:
- $0200-$0258 (89 bytes) The Input buffer, storage area for data read from screen.
- $02A7-$02FF (89 bytes) Unused memory.
- $0334-$033B (8 bytes) the 8 unused bytes before the tape buffer.
- $033C-$03FB (192 bytes) the Datasette/tape buffer.
- $03FC-$03FF (4 bytes) the 4 unused bytes after the tape buffer.

# DONE Combine disk command data into one buffer in KVAR

Combine disk command data strings in DATA segment, like `RM_TEXT` and `MV_TEXT` into
one string buffer in KVAR.

## DONE Disk status too small (potential buffer overflow)

Disk status text has size 30. But, the largest disk status text is 34 characters:

    0       1
    123456789012
    00, OK,00,00

    0       1         2         3
    1234567890123456789012345678901234
    66, ILLEGAL TRACK AND SECTOR,TT,SS

So we need a minimum of 35 bytes (1 for the nul-terminator)

## DONE Buffered output possible buffer overflow.

Originally, it used the tape buffer `KERNAL_TBUFFR`.

First problem is that it overwrites the `ARGC` and `PARGV` at the start of `KERNAL_TBUFFR`.
It works, but is not nice.

After we started using `KERNAL_TBUFFR` for variables, we moved the output buffer to `KVAR_UNUSED_1` (`$02A7-$02FF`, 89 bytes).
This size is fine. However, we need to protect against buffer overruns. For example `pr` a file with longer lines.

## DONE Check for file name too long (buffer overflow)

You can type very long names for `l`, `ls`, `mv`, `rm` that can lead to buffer overruns.

## Use registers `AX` .. `DX`


## TODO Add `echo` command

## TODO Cancel (STOP key) `l`, `ls`, `pr`

## TODO Pause (SHIFT) `pr`

## TODO Rename `pr` to `cat`

## TODO `cp`

Not just copy one file using a disk command, but also copying multiple files
matching a pattern between different devices.
Must be efficient (buffered). Buffer of 253/256 bytes needed?

Note that the built in Copy command can concatenate files

Copy REL and GEOS files correctly or (if we don't implement) do not copy.

## TODO Command history

Very nice to have.
Navigate through history with <CRSR UP DOWN> and <SHIFT>+<CRSR UP DOWN>
Need own input routine.
History buffer of ~80-256 is enough

Command `history` displays command history.

## TODO `format` command

Nice to have. Only if there is space left.

## TODO `validate` command

Nice to have. Only if there is space left.

## TODO `initialize` command

Nice to have. Only if there is space left.

## TODO `df` / `du` / `di`

Show Disk Free / Disk Usage / Disk Info

Show:
- Disk format
- Disk name
- DOS version and format

## TODO Built-in commands can handle multiple arguments

Like:
    l pattern1 pattern2 ...
    pr pattern1 pattern2 ...
    rm pattern1 pattern2 ...

And that they process patterns properly: process all matching files

We need a routine to iterate a directory and then callback on each matching directory item

    ;;; summary: Iterate directory with call back
    ;;; in:
    ;;;   ITERATE_DIR_CALLBACK: Set address of your callback routine. On return: C=0: continue C=1 cancel
    .proc ITERATE_DIR
    ...


## Simple and Extended directory listing

Simple listing: `l` and `ls` show only names, 2 per line. Maybe marker or color for directories

Extended: one file per line with more info, like:
- Size in blocks
- Unclosed *
- Deleted @ replacement
- Locked <
- Info on REL files
    - Record size
    - Number of side sectors in use
    - Number of records in use
    - Number of records available (in the used side sectors)
- Info on GEOS Files

## TODO At $C000

Must have: Keep code smaller than 4K

## Redirect from / to file with file name in quotation marks.

Now we have
    COMMAND < from > to

but this is not possible:

    COMMAND < "from file" > "to file"

## Optimize code

- jsr + rts -> jmp

## DONE Colors configurable optionally

If configuration border and background color is negative then do not set.

If configuration foreground color char is PETSCII_NUL then do not set.

## DONE Errors in table

Error messaging can be more efficient
Use a table and one error routine with error number index

Not in table turned out to use less code space.

## TODO BUG MY_NMI_HANDLER Pressing <RUN STOP> + <RESTORE> during load is handled incorrectly.

## DONE Why LOAD_PROGRAM_IF_NOT_ALREADY_LOADED twice?

Because one is the `load` command and the other is the command itself (i.e., load and execute).

## DONE Why STRING_COMPARE at end of TRY_BUILT_IN_COMMAND?

Call is not necessary, removed.

## TODO Open Close

Maybe we can save code space by making routine(s) for open and close file.

## DONE PROCESS_DISK_STATUS No push-pull needed

If we change the order of `KERNAL_SETNAM` and `KERNAL_SETLFS`, then push and pull `A`
is not necessary anymore.

## TODO Command name overflow

You can type in a command name of more that 16 characters, this can lead to buffer overflow.

The command name max length is the file name max length 16 minus 3 for ".sh".

## DONE Many calls to RESET_FILE_IO

Can be reduced to one.

## DONE MY_NMI_HANDLER does unneccessary things

We do not need to reset memory layout because `KERNAL_IOINIT` does that.

We can reuse `RESET_FILE_IO`.

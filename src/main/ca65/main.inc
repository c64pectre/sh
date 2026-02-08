;    sh: Shell for Commodore 64.
;    Copyright (C) 2026  C64PECTRE
;
;    This program is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    (at your option) any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program.  If not, see https://www.gnu.org/licenses/.
;
;    Contact: https://github.com/c64pectre/exehdr/ create an issue

DEFAULT_DEVICE = 8
DEFAULT_DRIVE = 0

DISK_COMMAND_FA = 15
DISK_COMMAND_SA = 15

REDIRECT_INPUT_FA = 1
REDIRECT_INPUT_SA = 2

REDIRECT_OUTPUT_FA = 2
REDIRECT_OUTPUT_FILE_SA = 3
REDIRECT_OUTPUT_PRINTER_DA = 4
REDIRECT_OUTPUT_PRINTER_SA = 7

FILE_FA = 4
FILE_SA = 4

FILE_NAME_TEXT_COLON_OFFSET_NAME = 2

COMMAND_NAME_SIZE = 5

ARGC_MAX = 10

ARGV_SIZE = ARGC_MAX

PROGRAM_ENTRYPOINT = $1800                                  ; Entry point of loaded program

FILE_NAME_MAX_LENGTH = 16

; summary: Maximum length for command name. Is file name max length minus 3 for ".sh" is 13.
COMMAND_NAME_MAX_LENGTH = FILE_NAME_MAX_LENGTH - 3

;region Built in command numbers

COMMAND_NUMBER_EXIT = 0
COMMAND_NUMBER_LOAD = 1
COMMAND_NUMBER_LS   = 2
COMMAND_NUMBER_L    = 3
COMMAND_NUMBER_RM   = 4
COMMAND_NUMBER_MV   = 5
COMMAND_NUMBER_PR   = 6
COMMAND_NUMBER_DISK = 7
COMMAND_NUMBER_WORK = 8
COMMAND_NUMBER_SYS  = 9

;endregion

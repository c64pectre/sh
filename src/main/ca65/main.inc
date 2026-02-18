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

;region Constants

DEFAULT_DEVICE = 8
DEFAULT_DRIVE = 0

DISK_COMMAND_FA = DEVICE_DISK_CHANNEL_COMMAND
DISK_COMMAND_FA_SA = DISK_COMMAND_FA

REDIRECT_INPUT_FA = 1
REDIRECT_INPUT_SA = 2

REDIRECT_OUTPUT_FA = 2
REDIRECT_OUTPUT_FILE_SA = 3
REDIRECT_OUTPUT_PRINTER_DA = 4                              ; MPS-801 / MPS-802 / MPS-803
REDIRECT_OUTPUT_PRINTER_SA = 7                              ; Business character mode (uper and lower case)

FILE_FA = 4
FILE_FA_SA = FILE_FA

COMMAND_NAME_SIZE = 5

ARGC_MAX = 10

ARGV_SIZE = ARGC_MAX

PROGRAM_ENTRYPOINT = $1800                                  ; Entry point of loaded program

FILE_NAME_MAX_LENGTH = 16

DISK_NAME_MAX_LENGTH = 16

; Maybe it's 41
DISK_COMMAND_MAX_LENGTH = 40

DISK_ID_LENGTH = 2

; summary: Maximum length for command name. Is file name max length minus 3 for ".sh" is 13.
COMMAND_NAME_MAX_LENGTH = FILE_NAME_MAX_LENGTH - 3

;endregion

;region Built in command numbers

COMMAND_NUMBER_BYE  = 0
COMMAND_NUMBER_LOAD = 1
COMMAND_NUMBER_LS   = 2
COMMAND_NUMBER_L    = 3
COMMAND_NUMBER_RM   = 4
COMMAND_NUMBER_MV   = 5
COMMAND_NUMBER_PR   = 6
COMMAND_NUMBER_DISK = 7
COMMAND_NUMBER_WORK = 8
COMMAND_NUMBER_SYS  = 9

;region Error numbers

ERROR_NUMBER_COMMAND_NOT_FOUND     = 0
ERROR_NUMBER_CANT_OPEN_INPUT_FILE  = 1
ERROR_NUMBER_CANT_OPEN_OUTPUT_FILE = 2
ERROR_NUMBER_PRINTER_NOT_PRESENT   = 3
ERROR_NUMBER_DEVICE_NOT_PRESENT    = 4
ERROR_NUMBER_INCORRECT_ARGUMENTS   = 5
ERROR_NUMBER_DRIVE_NOT_PRESENT     = 6
ERROR_NUMBER_FILE_NAME_TOO_LONG    = 7
ERROR_NUMBER_WRONG_DEVICE          = 8
ERROR_NUMBER_WRONG_DRIVE           = 9

;endregion

;region Boolean values

;;; summary: False value
;;; notes:
;;;   You can use the `bit` instruction to test a boolean value without changing any register:
;;;       bit M
;;;       bpl FALSE_BRANCH
;;;       bmi TRUE_BRANCH
;;;   You can flip a boolean value without changing any register:
;;;     From `FALSE` to `TRUE`:
;;;         dec M
;;;     From `TRUE` to `FALSE`:
;;;         inc M
FALSE = 0
TRUE = $FF

;endregion

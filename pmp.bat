rem    sh: Shell for Commodore 64.
rem    Copyright (C) 2026  C64PECTRE
rem
rem    This program is free software: you can redistribute it and/or modify
rem    it under the terms of the GNU General Public License as published by
rem    the Free Software Foundation, either version 3 of the License, or
rem    (at your option) any later version.
rem
rem    This program is distributed in the hope that it will be useful,
rem    but WITHOUT ANY WARRANTY; without even the implied warranty of
rem    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
rem    GNU General Public License for more details.
rem
rem    You should have received a copy of the GNU General Public License
rem    along with this program.  If not, see https://www.gnu.org/licenses/.
rem
rem    Contact: https://github.com/c64pectre/exehdr/ create an issue

set PMP_PROJECT_GROUP_ID=org.cpectre64
set PMP_PROJECT_ARTIFACT_ID=sh
set PMP_PROJECT_ARTIFACT_VERSION=1.0.0-SNAPSHOT
set PMP_PROJECT_PACKAGING=prg

set PMP_COMPILER=ca65
set PMP_COMPILER_CA65_OPTIONS=--ignore-case --feature bracket_as_indirect

set PMP_PACKAGER=ld65

set PMP_RUNNER=x64sc
set PMP_RUNNER_X64SC_OPTIONS=-drive8type 1541 -drive9type 1541 -9 "ps-powerc-1 [spinnaker][1986-10-16].d64" +confirmonexit +saveres -model c64 -windowxpos 10 -windowypos 10 -monitorxpos 700 -monitorypos 900 -monitorwidth 1000 -jamaction 2

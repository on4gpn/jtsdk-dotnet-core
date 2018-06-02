::-----------------------------------------------------------------------------::
:: Name .........: jtsdk-maint-env.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Maintenance Environment for JTSDK
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call jtsdk-maint-env.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: jtsdk-maint-env.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: jtsdk-maint-env.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF
SET URL=https://github.com/KI7MT/jtsdk-dotnet-core.git
SET JTSDK_HOME=%CD%
SET pgitv=2.17.1.2


:: .Net Version at time fo initial release
IF EXIST %CD%\ver.jtsdk (
SET /P ver_jtsdk=<ver.jtsdk
)
IF EXIST %CD%\ver.dotnet (
SET /P ver_dotnet=/P version=<ver.dotnet
)

:: Set some basic ennvironment variables
COLOR 0E
SET LANG=en_US

:: Set Minimal Path
SET git_dir=%JTSDK_HOME%\tools\pgit\%pgitv%\cmd
SET dotnet_dir=%JTSDK_HOME%\tools\dotnet\%ver_dotnet%
SET unix_tools=%JTSDK_HOME%\tools\msys2\usr\bin
SET srcd=%JTSDK_HOME%\src

:: Set Final path
SET PATH=%JTSDK_HOME%;%git_dir%;%dotnet_dir%;%unix_tools%;%srcd%;%WINDIR%\System32

:: Make sure srcd exists

:: Full paths are needed for some versions of Windows
:: Why some are and others are not, is still unknown.
SET version=%version% %rev%
TITLE JTSDK Maintenance Console

:: Doskey's for use with the Maintenance Environment
DOSKEY help-checkout=@echo This feature has not be implemented yet.
DOSKEY help-install=@echo This feature has not be implemented yet.
DOSKEY help-upgrade=@echo This feature has not be implemented yet.
DOSKEY clone-jtsdk=git clone %URL% jtsdk-master
DOSKEY update-jtsdk=git pull
DOSKEY clear=cls
DOSKEY ls=dir

:: Start Main Script
CD /D %JTSDK_HOME%
IF NOT EXIST %srcd% (mkdir %srcd%)
CLS
ECHO -----------------------------------------------------------
ECHO  JTSDK Maintenance Environment - %version%
ECHO -----------------------------------------------------------
ECHO.
ECHO  JTSDK Version .........: %ver_jtsdk%
ECHO  .Net Core Versoin .....: %ver_dotnet%
ECHO.
ECHO  Provides Access To: Subversion, Git, and many other Gnu
ECHO  tools from the MSYS2 bin diretory.
ECHO.
ECHO  NOTE: Unix applicaitons are enabled by default.
ECHO.
ECHO  - For Checkout Help ..: help-checkout
ECHO  - For Update Help ....: help-update
ECHO  - For Upgrade Help ...: help-upgrade
ECHO.

%COMSPEC% /A /Q /K
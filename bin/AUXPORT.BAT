@echo off
@if "%1" == "/h" or "%1" == "/H" or "%1" == "/?" goto dohelp
@if "%1" == "=" shift
@if "%1" == "" goto show_stat
printmap com1=aux%1
goto exit
:show_stat
printmap com1
goto exit
:dohelp
echo AUXPORT R1.0     Sets or displays the default serial port
echo Copyright (c) 1994 Intelligent Micro Software Limited.
echo All rights reserved.
echo .o
echo Syntax:
echo    AUXPORT [/H] [=[n]]
echo .o
echo o   /H      gives this screen
echo    n       auxiliary port to assign
echo    none    no parameters displays the current AUX assignments
echo .o
echo Examples:
echo    AUXPORT 1
echo    AUXPORT
echo .o
:exit

@echo off

if "%1"=="/help" goto help
if "%1"=="/?" goto help

SET TARGET=VC-WIN32 no-asm
if "%1"=="nasm" SET TARGET=VC-WIN32
if "%1"=="masm" SET TARGET=VC-WIN64A-masm
if "%1"=="win64" SET TARGET=VC-WIN64A no-asm
if "%1"=="win32" if "%2"=="nasm" SET TARGET=VC-WIN32
if "%2"=="win32" if "%1"=="nasm" SET TARGET=VC-WIN32
if "%1"=="win64" if "%2"=="masm" SET TARGET=VC-WIN64A-masm
if "%2"=="win64" if "%1"=="masm" SET TARGET=VC-WIN64A-masm
if "%1"=="win64" if "%2"=="nasm" SET TARGET=VC-WIN64A
if "%2"=="win64" if "%1"=="nasm" SET TARGET=VC-WIN64A

if "%TARGET%"=="VC-WIN32" SET gendir=generated_win32_nasm
if "%TARGET%"=="VC-WIN32 no-asm" SET gendir=generated_win32
if "%TARGET%"=="VC-WIN64A no-asm" SET gendir=generated_win64A
if "%TARGET%"=="VC-WIN64A" SET gendir=generated_win64A_nasm
if "%TARGET%"=="VC-WIN64A-masm" SET gendir=generated_win64A_masm

mkdir %gendir%
cd %gendir%
perl ..\Configure %TARGET% no-makedepend
nmake build_all_generated
cd ..

if "%1"=="" if "%2" == "" goto help
goto done

:help

echo Usage:
echo    prebuild [win32]       - win32, no asm (default)
echo    prebuild [win32] nasm  - win32, nasm
echo    prebuild [win64] masm  - win64, masm
echo    prebuild win64         - win64, no asm
echo    prebuild win64 nasm    - win64, nasm


:done



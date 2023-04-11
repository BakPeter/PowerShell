@echo off

if "%1"=="" ( set psScriptFullPath="C:\Workspaces\PowerShell\script.ps1" ) else ( set psScriptFullPath=%1 )
echo psScriptFullPath=%psScriptFullPath%
@REM echo param2=%2
@REM echo param3=%3

powershell -ExecutionPolicy Bypass -File %psScriptFullPath%
@echo off

if "%1"=="" ( set psScriptFullPath="D:\PowerShell\script.ps1" ) else ( set psScriptFullPath=%1 )
echo psScriptFullPath=%psScriptFullPath%
echo param2=%2
echo param3=%3

powershell -ExecutionPolicy Bypass -File %psScriptFullPath% "%2" "%3"
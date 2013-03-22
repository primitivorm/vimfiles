@echo off
gacutil.exe 1> deletethis 2>&1
set csregerror="false"
if errorlevel 9009 goto gacutilnotinpath
goto regasmcheck
:gacutilnotinpath
echo "Gacutil.exe is not in path. Error in installaing C# Intellisense plugin. Add gacutil.exe in path and then run reg.bat in the current directory!" > cserror.log
set csregerror="true"
:regasmcheck
regasm.exe 1> deletethis 2>&1
if errorlevel 9009 goto regasmnotinpath
goto doreg
:regasmnotinpath
echo "Regasm is not in path. Error in installaing C# Intellisense plugin. Add regasm in path and then run reg.bat in the current directory!" >> cserror.log
set csregerror="true"

:doreg
if %csregerror% EQU "true" goto endreg
gacutil -i CSVimHelper.dll -f
regasm /tlb:CSVimHelper.tlb CSVimHelper.dll
goto endreg

:endreg
del deletethis

cd %~dp0
@Echo off
>> nul chcp 65001
>> nul chcp 65001
title Сканер сети
color 6
echo analyze >> analyze.log
del analyze.log
cls
echo Сети:
echo.
ipconfig
echo.
set /p n="Укажите сеть (например 192.168.0):"
cls
color 2
echo Сканирование %n%.??? начато, это займет пару минут...
for %%i in (1 2 3 4 5 6 7 8 9) do ping %n%.%%i -w 5 -n 1| find "TTL" >> analyze.log
for %%i in (1 2 3 4 5 6 7 8 9) do for %%j in (0 1 2 3 4 5 6 7 8 9) do ping %n%.%%i%%j -w 5 -n 1| find "TTL" >> analyze.log
for %%i in (1 2) do for %%j in (0 1 2 3 4 5) do for %%c in (0 1 2 3 4 5) do ping %n%.%%i%%j%%c -w 5 -n 1| find "TTL" >> analyze.log
arp -a >> analyze.log
analyze.log
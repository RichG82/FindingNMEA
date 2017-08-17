@ECHO OFF

rd bin -Recurse -Force
mkdir bin

XCOPY bower_components\*.* bin\bower_components\*.* /E /Y
XCOPY etc\*.* bin\etc\*.* /E /Y
XCOPY src\html\*.* bin\*.* /E /Y
XCOPY src\css\*.* bin\css\*.* /E /Y
XCOPY src\DataReciever\*.* bin\DataReciever\*.* /E /Y
XCOPY src\js\*.* bin\js\*.* /E /Y
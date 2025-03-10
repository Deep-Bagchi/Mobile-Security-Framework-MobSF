@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  jadx startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and JADX_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Xms128M" "-Xmx4g" "-XX:+UseG1GC" "-Dlogback.configurationFile=%APP_HOME%/bin/jadx.xml"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\jadx-cli-1.0.0.jar;%APP_HOME%\lib\jadx-core-1.0.0.jar;%APP_HOME%\lib\dx-1.16.jar;%APP_HOME%\lib\android-5.1.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\slf4j-api-1.7.26.jar;%APP_HOME%\lib\baksmali-2.2.7.jar;%APP_HOME%\lib\smali-2.2.7.jar;%APP_HOME%\lib\util-2.2.7.jar;%APP_HOME%\lib\jcommander-1.74.jar;%APP_HOME%\lib\asm-7.1.jar;%APP_HOME%\lib\annotations-17.0.0.jar;%APP_HOME%\lib\cloning-1.9.12.jar;%APP_HOME%\lib\gson-2.8.5.jar;%APP_HOME%\lib\dexlib2-2.2.7.jar;%APP_HOME%\lib\guava-27.1-jre.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\objenesis-3.0.1.jar;%APP_HOME%\lib\antlr-runtime-3.5.2.jar;%APP_HOME%\lib\stringtemplate-3.2.1.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-2.5.2.jar;%APP_HOME%\lib\error_prone_annotations-2.2.0.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.17.jar;%APP_HOME%\lib\antlr-2.7.7.jar

@rem Execute jadx
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %JADX_OPTS%  -classpath "%CLASSPATH%" jadx.cli.JadxCLI %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable JADX_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%JADX_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega

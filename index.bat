@echo off
cls
if exist build rmdir /s /q build
mkdir build
cd src
javac -d ../build com/krzem/spring/Main.java&&jar cvmf ../manifest.mf ../build/spring.jar -C ../build *&&goto run
cd ..
goto end
:run
cd ..
pushd "build"
for /D %%D in ("*") do (
	rd /S /Q "%%~D"
)
for %%F in ("*") do (
	if /I not "%%~nxF"=="spring.jar" del "%%~F"
)
popd
cls
java -jar build/spring.jar
:end

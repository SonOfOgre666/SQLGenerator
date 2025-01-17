@echo off
REM Windows build script
REM ================================

REM Generate parser with JavaCC
echo Generating parser files...
call javacc SQLGenerator.jj
if errorlevel 1 echo JavaCC generation completed with warnings

REM Compile generated Java files
echo Compiling Java files...
javac *.java

REM Run the program with test file
echo Running the program...
java -Dfile.encoding=UTF-8 SQLGenerator < input.txt

REM Clean up generated temporary files
echo Cleaning up generated files...
del /Q *.class
del /Q Token*.java Parser*.java Simple*.java SQLGenerator*.java JavaCharStream.java ParseException.java
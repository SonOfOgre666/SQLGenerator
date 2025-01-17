@echo off
REM Script de construction pour Windows
REM ================================

REM Génération du parseur avec JavaCC
echo Generating parser files...
call javacc SQLGenerator.jj
if errorlevel 1 echo JavaCC generation completed with warnings

REM Compilation des fichiers Java générés
echo Compiling Java files...
javac *.java

REM Exécution du programme avec le fichier de test
echo Running the program...
java -Dfile.encoding=UTF-8 SQLGenerator < input.txt

REM Nettoyage des fichiers temporaires générés
echo Cleaning up generated files...
del /Q *.class
del /Q Token*.java Parser*.java Simple*.java SQLGenerator*.java JavaCharStream.java ParseException.java
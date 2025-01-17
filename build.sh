#!/bin/bash

# Script de construction pour Linux/Unix
# ====================================

echo "Compilation du projet..."

# Génération des fichiers Java avec JavaCC
javacc SQLGenerator.jj

# Compilation des fichiers Java générés
javac *.java

# Exécution du programme avec le fichier de test
echo "Test avec le fichier d'entrée test_input.txt :"
echo "----------------------------------------"
echo "----------------------------------------"
echo "----------------------------------------"
java -Dfile.encoding=UTF-8 SQLGenerator < input.txt

# Nettoyage des fichiers temporaires générés
echo "Nettoyage des fichiers générés..."
rm -f *.class
rm -f Token*.java Parser*.java Simple*.java SQLGenerator*.java JavaCharStream.java ParseException.java

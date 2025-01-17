#!/bin/bash

# Linux/Unix build script
# ====================================

echo "Building project..."

# Generate Java files with JavaCC
javacc SQLGenerator.jj

# Compile generated Java files
javac *.java

# Run the program with test file
echo "Test with input.txt file:"
echo "----------------------------------------"
echo "----------------------------------------"
echo "----------------------------------------"
java -Dfile.encoding=UTF-8 SQLGenerator < input.txt

# Clean up generated temporary files
echo "Cleaning up generated files..."
rm -f *.class
rm -f Token*.java Parser*.java Simple*.java SQLGenerator*.java JavaCharStream.java ParseException.java

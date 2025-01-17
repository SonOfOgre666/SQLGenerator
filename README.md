# SQL Generator 

This project allows you to generate SQL queries from a simplified syntax. It transforms a simple database description into SQL CREATE TABLE statements.

## Installation and Execution Guide 

### For Windows 

1. **Required Components Installation:**
   - Navigate to the `windows_requirement` folder provided with the project
   - Copy the following folders to `C:\Program Files\Java\`:
     - `javacc`
     - `jdk-23`
     - `jre1.8.0_431`

2. **Environment Variables Configuration:**
   1. Open Start menu and search for "environment variables"
   2. Click on "Edit the system environment variables"
   3. In the "System Properties" window, click on "Environment Variables..."
   4. In the "System variables" section, find the "Path" variable
   5. Select "Path" and click "Edit..."
   6. Click "New" and add the following paths (one by one):
      ```
      C:\Program Files\Java\javacc\javacc-7.0.13\scripts
      C:\Program Files\Java\jdk-23\bin
      C:\Program Files\Java\jre1.8.0_431\bin
      ```
   7. Click "OK" to close each window

3. **Installation Verification:**
   - Open a new command prompt (cmd) and type:
     ```batch
     java -version
     javac -version
     javacc -version
     ```
   - If the commands display versions without errors, the installation is successful

4. **Project Execution:**
   - If using PowerShell:
     ```powershell
     ./build.bat
     ```
   - If using Command Prompt (cmd):
     ```batch
     build.bat
     ```

### For Linux 

1. **Java Installation:**
```bash
# For Ubuntu/Debian
sudo apt update
sudo apt install default-jdk

# Verify installation
java -version
javac -version
```

2. **JavaCC Installation:**
```bash
# For Ubuntu/Debian
sudo apt install javacc

# Verify installation
javacc -version
```

3. **Project Preparation and Execution:**
```bash
# Make the build script executable
chmod +x build.sh

# Compile and run
./build.sh
```

### For macOS 

1. **Java and JavaCC Installation:**
```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Java and JavaCC
brew install openjdk
brew install javacc

# Verify installation
java -version
javac -version
javacc -version
```

2. **Project Preparation and Execution:**
```bash
# Make the build script executable
chmod +x build.sh

# Compile and run
./build.sh
```

## Input File Format 

To generate SQL queries, you need to edit the `input.txt` file. This file uses a simplified syntax to describe your tables.

### Basic Syntax
```
table table_name:
- column_name(type, constraint1, constraint2, ...)
```

### Available Types
- `integer`: For integer numbers (SQL INT)
- `text`: For character strings (SQL VARCHAR(255))
- `date`: For dates (SQL DATE)

### Available Constraints
- `primary key`: Defines the table's primary key (PRIMARY KEY)
- `auto`: Auto-increment for integers (AUTO_INCREMENT)
- `required`: Required field (NOT NULL)
- `unique`: Unique value (UNIQUE)
- `default: value`: Sets a default value
  - `today`: For current date (CURRENT_DATE)
  - `now`: For current date and time (CURRENT_TIMESTAMP)
- `reference: table.column`: Creates a foreign key (FOREIGN KEY)

## Usage Examples 

1. **Simple Example (2 Linked Tables)**
Copy this content into `input.txt`:
```
table students:
- id(integer, primary key, auto)
- name(text, required)
- email(text, unique)
- registration_date(date, default: today)

table grades:
- id(integer, primary key, auto)
- student_id(integer, required, reference: students.id)
- subject(text, required)
- grade(integer, required)
- exam_date(date, default: today)
```

2. **Complex Example (Blog System)**
```
table users:
- id(integer, primary key, auto)
- username(text, required, unique)
- email(text, required, unique)
- creation_date(date, default: now)

table articles:
- id(integer, primary key, auto)
- author_id(integer, required, reference: users.id)
- title(text, required)
- content(text, required)
- publication_date(date, default: now)

table comments:
- id(integer, primary key, auto)
- article_id(integer, required, reference: articles.id)
- user_id(integer, required, reference: users.id)
- content(text, required)
- comment_date(date, default: now)
```

### How to Use 

1. Edit the `input.txt` file with your table structure
2. Run the compilation script:
   - On Windows (PowerShell): `./build.bat`
   - On Windows (CMD): `build.bat`
   - On Linux/macOS: `./build.sh`
3. The program will generate the corresponding SQL queries in the console

### Important Notes 
- Respect indentation with dashes (-) for columns
- Each table must have at least one column
- Keywords like `table`, `primary key`, etc. are case-sensitive
- To generate new SQL, simply modify `input.txt` and run the script again
- Comments in `input.txt` start with `#`
- The program automatically cleans up generated files after execution

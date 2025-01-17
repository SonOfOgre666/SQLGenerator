# Générateur SQL 🎯

Ce projet permet de générer des requêtes SQL à partir d'une syntaxe simplifiée. Il transforme une description simple de base de données en instructions SQL CREATE TABLE.

## Guide d'Installation et d'Exécution 🔧

### Pour Windows 🪟

1. **Installation des composants requis :**
   - Naviguez vers le dossier `windows_requirement` fourni avec le projet
   - Copiez les dossiers suivants vers `C:\Program Files\Java\` :
     - `javacc`
     - `jdk-23`
     - `jre1.8.0_431`

2. **Configuration des variables d'environnement :**
   1. Ouvrez le menu Démarrer et recherchez "variables d'environnement"
   2. Cliquez sur "Modifier les variables d'environnement système"
   3. Dans la fenêtre "Propriétés système", cliquez sur "Variables d'environnement..."
   4. Dans la section "Variables système", trouvez la variable "Path"
   5. Sélectionnez "Path" et cliquez sur "Modifier..."
   6. Cliquez sur "Nouveau" et ajoutez les chemins suivants (un par un) :
      ```
      C:\Program Files\Java\javacc\javacc-7.0.13\scripts
      C:\Program Files\Java\jdk-23\bin
      C:\Program Files\Java\jre1.8.0_431\bin
      ```
   7. Cliquez sur "OK" pour fermer chaque fenêtre

3. **Vérification de l'installation :**
   - Ouvrez une nouvelle invite de commande (cmd) et tapez :
     ```batch
     java -version
     javac -version
     javacc -version
     ```
   - Si les commandes affichent les versions sans erreur, l'installation est réussie

4. **Exécution du projet :**
   - Si vous utilisez PowerShell :
     ```powershell
     ./build.bat
     ```
   - Si vous utilisez l'invite de commande (cmd) :
     ```batch
     build.bat
     ```

### Pour Linux 🐧

1. **Installation de Java :**
```bash
# Pour Ubuntu/Debian
sudo apt update
sudo apt install default-jdk

# Vérifiez l'installation
java -version
javac -version
```

2. **Installation de JavaCC :**
```bash
# Pour Ubuntu/Debian
sudo apt install javacc

# Vérifiez l'installation
javacc -version
```

3. **Préparation et exécution du projet :**
```bash
# Rendez le script de compilation exécutable
chmod +x build.sh

# Compilation et exécution
./build.sh
```

### Pour macOS 🍎

1. **Installation de Java et JavaCC :**
```bash
# Installez Homebrew si ce n'est pas déjà fait
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installez Java et JavaCC
brew install openjdk
brew install javacc

# Vérifiez l'installation
java -version
javac -version
javacc -version
```

2. **Préparation et exécution du projet :**
```bash
# Rendez le script de compilation exécutable
chmod +x build.sh

# Compilation et exécution
./build.sh
```

## Format du Fichier d'Entrée 📝

Pour générer vos requêtes SQL, vous devez éditer le fichier `input.txt`. Ce fichier utilise une syntaxe simplifiée pour décrire vos tables.

### Syntaxe de Base
```
table nom_table:
- nom_colonne(type, contrainte1, contrainte2, ...)
```

### Types Disponibles
- `entier` : Pour les nombres entiers (INT en SQL)
- `texte` : Pour les chaînes de caractères (VARCHAR(255) en SQL)
- `date` : Pour les dates (DATE en SQL)

### Contraintes Disponibles
- `clé primaire` : Définit la clé primaire de la table (PRIMARY KEY)
- `auto` : Auto-incrémentation pour les entiers (AUTO_INCREMENT)
- `requis` : Champ obligatoire (NOT NULL)
- `unique` : Valeur unique (UNIQUE)
- `par défaut: valeur` : Définit une valeur par défaut
  - `aujourd'hui` : Pour la date du jour (CURRENT_DATE)
  - `maintenant` : Pour la date et l'heure actuelles (CURRENT_TIMESTAMP)
- `référence: table.colonne` : Crée une clé étrangère (FOREIGN KEY)

## Exemples d'Utilisation 💡

1. **Exemple Simple (2 Tables Liées)**
Copiez ce contenu dans `input.txt` :
```
table etudiants:
- id(entier, clé primaire, auto)
- nom(texte, requis)
- email(texte, unique)
- date_inscription(date, par défaut: aujourd'hui)

table notes:
- id(entier, clé primaire, auto)
- etudiant_id(entier, requis, référence: etudiants.id)
- matiere(texte, requis)
- note(entier, requis)
- date_exam(date, par défaut: aujourd'hui)
```

2. **Exemple Complexe (Système de Blog)**
```
table utilisateurs:
- id(entier, clé primaire, auto)
- username(texte, requis, unique)
- email(texte, requis, unique)
- date_creation(date, par défaut: maintenant)

table articles:
- id(entier, clé primaire, auto)
- auteur_id(entier, requis, référence: utilisateurs.id)
- titre(texte, requis)
- contenu(texte, requis)
- date_publication(date, par défaut: maintenant)

table commentaires:
- id(entier, clé primaire, auto)
- article_id(entier, requis, référence: articles.id)
- utilisateur_id(entier, requis, référence: utilisateurs.id)
- contenu(texte, requis)
- date_commentaire(date, par défaut: maintenant)
```

### Comment Utiliser 🔄

1. Éditez le fichier `input.txt` avec votre structure de tables
2. Exécutez le script de compilation :
   - Sous Windows (PowerShell) : `./build.bat`
   - Sous Windows (CMD) : `build.bat`
   - Sous Linux/macOS : `./build.sh`
3. Le programme générera les requêtes SQL correspondantes dans la console

### Notes Importantes ⚠️
- Respectez l'indentation avec des tirets (-) pour les colonnes
- Chaque table doit avoir au moins une colonne
- Les mots-clés comme `table`, `clé primaire`, etc. sont sensibles aux accents
- Pour une nouvelle génération SQL, modifiez simplement `input.txt` et relancez le script
- Les commentaires dans `input.txt` commencent par `#`
- Le programme nettoie automatiquement les fichiers générés après l'exécution

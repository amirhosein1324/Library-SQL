# Library-SQL

A python library-data project that stores books, authors, publishers and related entities in SQLite. This repository contains a SQL schema & different data, a lightweight set of model classes, an "adapter" module that performs persistence (CRUD) against SQLite, a simple adding / deleting rows, and a script that demonstrates loading the SQL data into model objects.
---

## Quick overview

- Library.sql — full SQL schema plus seeded sample data.
- Library.db — a built SQLite database file (binary).
- model.py — plain Python model classes for Category, Author, Publisher, Language, CoverDesigner, Translator, Resources and Book.
- LibraryDataAdapter.py — the data access layer: opens a sqlite3 connection and implements get_all / insert / delete for entities and handles many-to-many join tables for books.
- adapter.py — a small interactive REPL that lets you insert or delete authors, publishers, languages, designers, translators, resources, categories and books using text commands.
- main.py — runs the SQL script (Library.sql) to build the database and demonstrates loading tables into model instances.
---

## How to run

Requirements
- Python 3.8+ (uses builtin sqlite3 and datetime). No external pip packages required.

To create the database from the SQL and load it:
1. python main.py
   - main.py executes `Library.sql` with sqlite3 and prints a short summary of loaded entities.

---

## File-by-file explanation

### model.py
This file defines simple Python classes that represent the domain objects:Category,Author,Publisher,Language,CoverDesigner,Translator,Resources, and Book. Each class:

- Declares attributes relevant to the entity (Author has id,name,birthdate,nationality) and etc.

---

### LibraryDataAdapter.py 
Handles all SQLite persistence using `sqlite3`, with adapters for all entities.  
Provides `get_all`,`insert`,`delete`, plus complex join-table logic for Books.  
Needs parameterized SQL; commits on each operation.

---

### adapter.py
Console REPL for inserting/deleting records via DataAdapters.  
Refreshes in-memory model lists each loop; parses simple whitespace-split commands.  
Book insertion requires strict field order and JSON arrays.

---

### main.py 
Executes `Library.sql` to create/seed the database.  
Builds model objects and reconstructs Books with related entities.  
Prints simple summaries; serves as DB setup/demo loader.

---

### Library.sql 
Defines full schema including all join tables.  
Provides extensive seed data for all core library entities.  
Used to initialize or rebuild the database.

---

### Examples

#### Insert an author 
`insert author "Jane_Doe" 1980-02-10 American`  
Adds a new author using whitespace-split fields.  
Name cannot contain spaces unless REPL parsing is modified.

#### Insert a language 
`insert language English`  
Creates a new language entry.  
Takes a single string argument.

#### Delete an author
`delete author 5`  
Removes the author with id 5.  
Fails if referenced by any book.

#### Insert a book 
`insert book "Meow" 2041 [1,2] Adult 2021-07-15 [4,5] 19.99 [1] 3 [1] [2] [1,3]`  
Requires strict ordering of title, code, lists, age group, date, price, publisher.  
Multi-value fields must be JSON arrays.

---

## Thanks for reading

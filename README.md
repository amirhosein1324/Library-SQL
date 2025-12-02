# Library-SQL

A python library-data project that stores books, authors, publishers and related entities in SQLite. This repository contains a SQL schema & different data, a lightweight set of model classes, an "adapter" module that performs persistence (CRUD) against SQLite, a simple adding / deleting rows, and a script that demonstrates loading the SQL data into model objects.

This README explains what each file does, how to run the project , and my experience when i was writing the code.

---

## Quick overview

Files you will find in the repository
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

To use the interactive CLI for inserting/deleting entities:
1. python adapter.py
   - adapter.py opens a REPL. Type "help" for command formats.
   - Example insert commands shown in the CLI help:
     - Insert author: `insertauthor[name][birthdate][nationality]`
     - Insert publisher: `insertpublisher[name][address][website]`
  - Insert book (example format printed in the REPL):
  - insert book hello 1040 Adult 2020-10-07 90 4 
     - Delete: `delete author 5`
---

## File-by-file explanation

### model.py
This file defines simple Python classes that represent the domain objects:Category,Author,Publisher,Language,CoverDesigner,Translator,Resources, and Book. Each class:

- Declares attributes relevant to the entity (Author has id,name,birthdate,nationality).
- Defines a class-level list (`Author.authors`) that the rest of the code uses as an in-memory cache of database objects.
- Implements a simple __eq__ method for comparisons (this allows code to compare by id or by object).
- Book holds lists for many-to-many relations: categories, authors, languages, cover_designers, translators, resources.

These model classes are intentionally lightweight — they are simple containers, not full-featured ORMs.

---

### LibraryDataAdapter.py
This is the persistence layer that talks to SQLite via the builtin `sqlite3` module. The module opens `Library.db` on import and exposes several DataAdapter classes (CategoryDataAdapter, AuthorDataAdapter, PublisherDataAdapter, LanguageDataAdapter, DesignerDataAdapter, TranslatorDataAdapter, ResourcesDataAdapter, BookDataAdapter).

What each adapter does:
- get_all(): Reads rows from the relevant table and returns lists of model objects.
- insert(entity): Inserts a row and returns a model object populated with the assigned id (using cursor.lastrowid).
- delete(id): Attempts to remove an entity. Many deletes check join tables first and refuse to delete an entity that is referenced (to avoid orphaned join rows).

BookDataAdapter has additional logic to assemble Book objects across many join tables (book_author, book_category, book_language, book_designer, book_translator, resources_book) and to insert a new book and create the necessary join rows during insertion.

Notes and suggestions:
- The module currently builds SQL strings with Python string formatting (e.g., `"... VALUES ('{}')".format(...)`) — this is prone to SQL injection and formatting errors. Use parameterized queries (question marks + parameters) instead.
- Some return values and small bugs exist (see Known issues below). Review the `BookDataAdapter.get_all` and insert logic carefully if you plan to extend this code.
- Each adapter commits after operations; that's fine for this small project but consider using transactions for multi-step book inserts to ensure atomicity.

---

### adapter.py
This file implements a simple REPL (read–eval–print loop) to let you insert or delete items interactively from the console. High-level flow:

- On each loop iteration it refreshes the in-memory model caches by calling each DataAdapter.get_all() and storing results on the corresponding model class lists (e.g., model.Author.authors).
- It prints a short help block showing supported commands and example formats.
- It reads a line from input, splits tokens, then matches `insert` or `delete` commands and dispatches accordingly.
- For `insert book ...` the REPL validates input with regex and JSON-decoded lists (e.g., categories and author lists are written as JSON arrays like [1,2]).
- For each insert it constructs model objects and calls the appropriate LibraryDataAdapter insert function.

Usage notes:
- The REPL expects the exact tokenization used in the script: whitespace-split input. Complex titles or addresses with spaces may need to be quoted or modified in the script to accept multi-word strings.
- Book insertion expects many fields in a precise order — check the printed help in the REPL before using it.

---

### main.py
A small script demonstrating how to create/populate the database and load the contents into model objects:

- Opens `Library.sql` and runs `cur.executescript(sql_script)` to create tables and insert seeded data.
- Selects rows from tables such as publishers, authors, categories, languages, cover_designers, translators, resources and builds corresponding model objects.
- Selects rows from `books` and attempts to build Book instances linking them to the in-memory referenced objects (publisher, author, etc).
- Prints a short summary at the end (counts and an example book).

This script is primarily an example for loading data; it can be used to rebuild the DB from `Library.sql`.

---

### Library.sql
Contains the complete database schema and a generous set of seed data for demonstration:

- Tables: books, categories, authors, publishers, languages, cover_designers, translators, resources, customers, and many-to-many join tables (book_category, book_language, book_author, book_translator, book_designer, book_customer, resources_book).
- Insert statements populate these tables with sample rows so the demo scripts have data to operate on.

---

## Examples (REPL)

Insert an author:
- insert author "Jane_Doe" 1980-02-10 American
  (Note: the script splits on whitespace, so either avoid spaces or modify the parsing code.)

Insert a simple language:
- insert language English

Delete an author with id 5:
- delete author 5

Insert a book:
- insert book "Meow" 2041 Adult 2021-07-15
  - This example follows the exact order expected by the REPL:title,product_code,[category ids],age_group,release_date(YYYY-MM-DD),[author ids],price,[language ids],publisher_id,[designer ids],[translator ids],[resource ids].

Thanks for reading

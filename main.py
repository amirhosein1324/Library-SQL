import sqlite3
import model as md

db_name = "Library.db"
cn = sqlite3.connect(db_name)
cur = cn.cursor()

with open("Library.sql", "r", encoding="utf-8") as f:
    sql_script = f.read()
cur.executescript(sql_script)

data = list(cur.execute("SELECT id, name, address, website FROM publishers"))
m = [list(i) for i in data]
publishers = []
[publishers.append(md.Publisher(row[0], row[1], row[2], row[3])) for row in m]

data = list(cur.execute("SELECT id, name, birthdate, nationality FROM authors"))
m = [list(i) for i in data]
authors = []
[authors.append(md.Author(row[0], row[1], row[2], row[3])) for row in m]

data = list(cur.execute("SELECT id, name FROM categories"))
m = [list(i) for i in data]
categories = []
[categories.append(md.Category(row[0], row[1])) for row in m]

data = list(cur.execute("SELECT id, name FROM languages"))
m = [list(i) for i in data]
languages = []
[languages.append(md.Language(row[0], row[1])) for row in m]

data = list(cur.execute("SELECT id, name, birthdate, nationality FROM cover_designers"))
m = [list(i) for i in data]
cover_designers = []
[cover_designers.append(md.CoverDesigner(row[0], row[1], row[2], row[3])) for row in m]

data = list(cur.execute("SELECT id, name, language FROM translators"))
m = [list(i) for i in data]
translators = []
[translators.append(md.Translator(row[0], row[1] , row[2])) for row in m]

data = list(cur.execute("SELECT id, name FROM resources"))
m = [list(i) for i in data]
resources = []
[resources.append(md.Resources(row[0], row[1])) for row in m]

data = list(cur.execute("""SELECT id, title, product_code, category, age_group, author_id, publisher_id, release_date, price, language, cover_designer_id, translator_id, resources FROM books"""))
m = [list(i) for i in data]
books = []


for row in m:
    publisher = next((p for p in publishers if p.id == row[6]), None)
    category = next((c for c in categories if c.name == row[3]), None)
    lang = next((l for l in languages if l.name == row[9]), None)
    designer = next((d for d in cover_designers if d.id == row[10]), None)
    translator = next((t for t in translators if t.id == row[11]), None)
    resource = next((r for r in resources if r.name == row[12]), None)
    author = next((a for a in authors if a.id == row[5]), None)


    Xbook = md.Book()
    Xbook.id = row[0]
    Xbook.title = row[1]
    Xbook.product_code = row[2]
    Xbook.categories = category
    Xbook.age_group = row[4]
    Xbook.authors = [author] if author else []
    Xbook.publisher = publisher
    Xbook.release_date = row[7]
    Xbook.price = row[8]
    Xbook.languages = [lang] if lang else []
    Xbook.cover_designers = [designer] if designer else []
    Xbook.translators = [translator] if translator else []
    Xbook.resources = [resource] if resource else []
    books.append(Xbook)
    
cn.close()

print("loaded successfully")
print(f"publishers: {len(publishers)}")

print(f"authors: {len(authors)}")
print(f"books: {len(books)}")
print(f"example book: {books[0].title} by {books[0].authors[0].name if books[0].authors else 'Unknown'}")






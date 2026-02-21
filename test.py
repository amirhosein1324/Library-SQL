import LibraryDataAdapter
import model
import sqlite3


connection = sqlite3.connect("NewLibrary.db")
cursor = connection.cursor()

model.Book.books = LibraryDataAdapter.BookDataAdapter.get_all()

for i in (model.Book.books):
    print("id:", i.id, "title:", i.title, "product_code:", i.product_code, "categories:", [[j.id, j.name] for j in i.categories], "age_group:", i.age_group, "authors:", [[j.id, j.name] for j in i.authors], "publisher:", [
          i.publisher.id, i.publisher.name], "release_date:", i.release_date, "price:", i.price, "languages:", [[j.id, j.name] for j in i.languages], "cover_designers", [[j.id, j.name] for j in i.cover_designers], "translators:", [[j.id, j.name] for j in i.translators], "resources:", [[j.id, j.name] for j in i.resources],"\n")
    

result = AuthorDataAdapter.search("ali")
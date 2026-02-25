import LibraryDataAdapter
import model
import sqlite3


connection = sqlite3.connect("Library.db")
cursor = connection.cursor()

model.Book.books = LibraryDataAdapter.BookDataAdapter.get_all()
print("all books:")
for i in (model.Book.books):
    print("id:", i.id, " , title:", i.title, " , product_code:", i.product_code, " , categories:", [[j.id, j.name] for j in i.categories], " , age_group:", i.age_group, " , authors:", [[j.id, j.name] for j in i.authors], " , publisher:", [
          i.publisher.id, i.publisher.name], " , release_date:", i.release_date, " , price:", i.price, " , languages:", [[j.id, j.name] for j in i.languages], " , cover_designers", [[j.id, j.name] for j in i.cover_designers], " , translators:", [[j.id, j.name] for j in i.translators], " , resources:", [[j.id, j.name] for j in i.resources], "\n")
print("authors:")
s = LibraryDataAdapter.AuthorDataAdapter.search("")
for i in s:
    print("id:", i.id, " , name :", i.name, " , birthdate:",
          i.birthdate, " , nationality:", i.nationality)
print("///")
print("publishers:")
m = LibraryDataAdapter.PublisherDataAdapter.search("a")
for i in m:
    print("id:", i.id, " , name :", i.name, " , address:",
          i.address, " , website:", i.website)
print("///")
print("categories:")
m = LibraryDataAdapter.CategoryDataAdapter.search("fiction")
for i in m:
    print("id:", i.id, " , name :", i.name)
print("///")
print("languages:")
m = LibraryDataAdapter.LanguageDataAdapter.search("english")
for i in m:
    print("id:", i.id, " , name :", i.name)
print("///")
print("cover_designers:")
s = LibraryDataAdapter.DesignerDataAdapter.search("clara")
for i in s:
    print("id:", i.id, " , name :", i.name, " , birthdate:",
          i.birthdate, " , nationality:", i.nationality)
print("///")
print("translators:")
s = LibraryDataAdapter.TranslatorDataAdapter.search("pedro")
for i in s:
    print("id:", i.id, " , name :", i.name, " , languages:",
          i.languages,)
print("///")
print("resources:")
s = LibraryDataAdapter.ResourcesDataAdapter.search("maney")
for i in s:
    print("id:", i.id, " , name :", i.name,)
print("///")
print("search results:")
result = LibraryDataAdapter.BookDataAdapter.search(
    designer_name=None)
for i in result:
    print("id:", i.id, " , title:", i.title, " , product_code:", i.product_code, " , categories:", [[j.id, j.name] for j in i.categories], " , age_group:", i.age_group, " , authors:", [[j.id, j.name] for j in i.authors], " , publisher:", [
          i.publisher.id, i.publisher.name], " , release_date:", i.release_date, " , price:", i.price, " , languages:", [[j.id, j.name] for j in i.languages], " , cover_designers", [[j.id, j.name] for j in i.cover_designers], " , translators:", [[j.id, j.name] for j in i.translators], " , resources:", [[j.id, j.name] for j in i.resources], "\n")
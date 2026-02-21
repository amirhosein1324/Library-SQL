import model
import sqlite3
import datetime


connection = sqlite3.connect("NewLibrary.db")
cursor = connection.cursor()


class CategoryDataAdapter:

    @staticmethod
    def get_all():
        table = list(cursor.execute("SELECT * FROM categories;"))
        return [model.Category(row[0], row[1]) for row in table]

    def insert(category: model.Category):
        cursor.execute(
            "INSERT INTO categories (`name`) VALUES ('{}');".format(category.name))
        connection.commit()
        a = cursor.lastrowid
        return model.Category(a, category.name)

    def delete(id: int):
        n = cursor.execute("Select * from categories where id=={}".format(id))
        if len(list(n)) == 0:
            return False
        else:
            s = cursor.execute(
                "Select * from book_category where category_id=={}".format(id))

            if len(list(s)) == 0:
                cursor.execute(
                    "Delete from categories where id=={}".format(id))
                connection.commit()
                return True
            else:
                return False

    @staticmethod
    def search(name: str):
        s = cursor.execute("select * from authors where name like '%{}%'".format(name))
        lis = []
        for i in s:
            lis.append(model.Author(i[0], i[1], i[2], i[3]))
        return lis


class AuthorDataAdapter:

    @staticmethod
    def get_all():
        table = list(cursor.execute("SELECT * FROM authors;"))
        return [model.Author(row[0], row[1], datetime.date.fromisoformat(row[2]), row[3]) for row in table]

    @staticmethod
    def delete(id: int):
        s = cursor.execute("Select * from authors where id=={}".format(id))
        if len(list(s)) == 0:
            return False
        else:
            s = cursor.execute(
                "Select author_id from book_author where author_id=={}".format(id))

            if len(list(s)) == 0:
                cursor.execute("Delete from authors where id=={}".format(id))
                connection.commit()
                return True
            else:
                return False

    def insert(author: model.Author):
        cursor.execute("INSERT INTO authors (`name`,`birthdate`,`nationality`) VALUES ('{}','{}','{}');".format(
            author.name, author.birthdate, author.nationality))
        connection.commit()
        a = cursor.lastrowid
        return model.Author(a, author.name, author.birthdate, author.nationality)

    @staticmethod
    def search(name: str):
        s = cursor.execute(
            "select * from authors where nsme like '%{}%'".format(name))
        lis = []
        for i in s:
            lis.append(model.Author(i[0], i[1], i[2], i[3]))
        return lis


class PublisherDataAdapter:

    @staticmethod
    def get_all():
        table = list(cursor.execute("SELECT * FROM publishers;"))
        return [model.Publisher(row[0], row[1], row[2], row[3]) for row in table]

    def insert(publisher: model.Publisher):
        cursor.execute("INSERT INTO publishers (`name`,`address`,`website`) VALUES ('{}','{}','{}');".format(
            publisher.name, publisher.address, publisher.website))
        connection.commit()
        a = cursor.lastrowid
        return model.Publisher(a, publisher.name, publisher.address, publisher.website)

    def delete(id: int):
        n = cursor.execute("Select * from publishers where id=={}".format(id))
        if len(list(n)) == 0:
            return False
        else:
            s = cursor.execute(
                "Select publisher_id from books where publisher_id=={}".format(id))

            if len(list(s)) == 0:
                cursor.execute(
                    "Delete from publishers where id=={}".format(id))
                connection.commit()
                return True
            else:
                return False
            
    @staticmethod
    def search(name: str):
        s = cursor.execute("select * from authors where name like '%{}%'".format(name))
        lis = []
        for i in s:
            lis.append(model.Author(i[0], i[1], i[2], i[3]))
        return lis


class LanguageDataAdapter:
    @staticmethod
    def get_all():
        table = list(cursor.execute("SELECT * FROM languages;"))
        return [model.Language(row[0], row[1]) for row in table]

    def insert(language: model.Language):
        cursor.execute(
            "INSERT INTO languages (`name`) VALUES ('{}');".format(language.name,))
        connection.commit()
        a = cursor.lastrowid
        return model.Language(a, language.name)

    def delete(id: int):
        n = cursor.execute("Select * from languages where id=={}".format(id))
        if len(list(n)) == 0:
            return False
        else:
            s = cursor.execute(
                "Select * from book_language where language_id=={}".format(id))

            if len(list(s)) == 0:
                cursor.execute("Delete from languages where id=={}".format(id))
                connection.commit()
                return True
            else:
                return False


    @staticmethod
    def search(name: str):
        s = cursor.execute("select * from authors where name like '%{}%'".format(name))
        lis = []
        for i in s:
            lis.append(model.Author(i[0], i[1], i[2], i[3]))
        return lis
    

class DesignerDataAdapter:

    @staticmethod
    def get_all():
        table = list(cursor.execute("SELECT * FROM cover_designers;"))
        return [model.CoverDesigner(row[0], row[1], datetime.date.fromisoformat(row[2]), row[3]) for row in table]

    def insert(designer: model.CoverDesigner):
        cursor.execute("INSERT INTO cover_designers (`name`,`birthdate`,`nationality`) VALUES ('{}','{}','{}');".format(
            designer.name, designer.birthdate, designer.nationality))
        connection.commit()
        a = cursor.lastrowid
        return model.CoverDesigner(a, designer.name, designer.birthdate, designer.nationality)

    def delete(id: int):
        n = cursor.execute(
            "Select * from cover_designers where id=={}".format(id))
        if len(list(n)) == 0:
            return False
        else:
            s = cursor.execute(
                "Select * from book_designer where designer_id=={}".format(id))

            if len(list(s)) == 0:
                cursor.execute(
                    "Delete from cover_designers where id=={}".format(id))
                connection.commit()
                return True
            else:
                return False
            
    @staticmethod
    def search(name: str):
        s = cursor.execute("select * from authors where name like '%{}%'".format(name))
        lis = []
        for i in s:
            lis.append(model.Author(i[0], i[1], i[2], i[3]))
        return lis


class TranslatorDataAdapter:

    @staticmethod
    def get_all():
        table = list(cursor.execute("SELECT * FROM translators;"))
        languages = LanguageDataAdapter.get_all()
        return [model.Translator(row[0], row[1], list(filter(lambda lang: lang.name == row[2], languages))) for row in table]

    def insert(translator: model.Translator):
        cursor.execute("INSERT INTO translators (`name`,`language`) VALUES ('{}','{}');".format(
            translator.name, translator.languages))
        connection.commit()
        a = cursor.lastrowid
        return model.Translator(a, translator.name, translator.languages)

    def delete(id: int):
        n = cursor.execute("Select * from translators where id=={}".format(id))
        if len(list(n)) == 0:
            return False
        else:
            s = cursor.execute(
                "Select * from book_translator where translator_id=={}".format(id))

            if len(list(s)) == 0:
                cursor.execute(
                    "Delete from translators where id=={}".format(id))
                connection.commit()
                return True
            else:
                return False
            
    @staticmethod
    def search(name: str):
        s = cursor.execute("select * from authors where name like '%{}%'".format(name))
        lis = []
        for i in s:
            lis.append(model.Author(i[0], i[1], i[2], i[3]))
        return lis


class ResourcesDataAdapter:

    @staticmethod
    def get_all():
        table = list(cursor.execute("SELECT * FROM resources;"))
        return [model.Resources(row[0], row[1]) for row in table]

    def insert(resource: model.Resources):
        cursor.execute(
            "INSERT INTO resources (`name`) VALUES ('{}');".format(resource.name))
        connection.commit()
        a = cursor.lastrowid
        return model.Language(a, resource.name)

    def delete(id: int):
        n = cursor.execute("Select * from resources where id=={}".format(id))
        if len(list(n)) == 0:
            return False
        else:
            s = cursor.execute(
                "Select * from resources_book where resource_id=={}".format(id))

            if len(list(s)) == 0:
                cursor.execute("Delete from resources where id=={}".format(id))
                connection.commit()
                return True
            else:
                return False
            

    @staticmethod
    def search(name: str):
        s = cursor.execute("select * from authors where name like '%{}%'".format(name))
        lis = []
        for i in s:
            lis.append(model.Author(i[0], i[1], i[2], i[3]))
        return lis


class BookDataAdapter:

    @staticmethod
    def get_all():
        sql = "SELECT id,title,product_code,age_group,publisher_id,release_date,price,author_id,category_id,designer_id,language_id,translator_id,resource_id from books LEFT JOIN book_author on book_author.book_id==books.id LEFT JOIN book_category on book_category.book_id==books.id LEFT JOIN book_designer on book_designer.book_id==books.id LEFT JOIN book_language on book_language.book_id==books.id LEFT JOIN book_translator on book_translator.book_id==books.id LEFT JOIN resources_book on resources_book.book_id==books.id "
        table = list(cursor.execute(sql))

        categories = CategoryDataAdapter.get_all()
        authors = AuthorDataAdapter.get_all()
        publishers = PublisherDataAdapter.get_all()
        languages = LanguageDataAdapter.get_all()
        cover_designers = DesignerDataAdapter.get_all()
        translators = TranslatorDataAdapter.get_all()
        resources = ResourcesDataAdapter.get_all()

        books = []
        for row in table:
            book_id = row[0]
            title = row[1]
            product_code = row[2]
            age_group = row[3]
            publisher = publishers[publishers.index(row[4])]
            release_date = datetime.date.fromisoformat(row[5])
            price = row[6]

            book_categories = []

            for cat_row in table:

                if cat_row[0] == book_id and cat_row[8] is not None and cat_row[8] not in book_categories:

                    book_categories.append(
                        categories[categories.index(cat_row[8])])

            book_authors = []

            for auth_row in table:

                if auth_row[0] == book_id and auth_row[7] is not None and auth_row[7] not in book_authors:

                    book_authors.append(authors[authors.index(auth_row[7])])

            book_languages = []
            for lang_row in table:
                if lang_row[0] == book_id and lang_row[10] is not None and lang_row[10] not in book_languages:
                    book_languages.append(
                        languages[languages.index(lang_row[10])])

            book_designers = []
            for des_row in table:
                if des_row[0] == book_id and des_row[9] is not None and des_row[9] not in book_designers:
                    book_designers.append(
                        cover_designers[cover_designers.index(des_row[9])])

            book_translators = []
            for tran_row in table:
                if tran_row[0] == book_id and tran_row[11] is not None and tran_row[11] not in book_translators:
                    book_translators.append(
                        translators[translators.index(tran_row[11])])

            book_resources = []
            for res_row in table:
                if res_row[0] == book_id and res_row[12] is not None and res_row[12] not in book_resources:
                    book_resources.append(
                        resources[resources.index(res_row[12])])

            books.append(model.Book(
                id=book_id,
                title=title,
                product_code=product_code,
                categories=book_categories,
                age_group=age_group,
                authors=book_authors,
                publisher=publisher,
                release_date=release_date,
                price=price,
                languages=book_languages,
                cover_designers=book_designers,
                translators=book_translators,
                resources=book_resources))
        newbooks = []
        for i in books:
            status = True
            for j in newbooks:
                if j.id == i.id:
                    status = False
            if status:
                newbooks.append(i)
        return newbooks

    def delete(id: int):
        n = cursor.execute("Select * from books where id=={}".format(id))
        if len(list(n)) == 0:
            return False
        else:
            cursor.execute(
                "Delete FROM book_author where book_id=={};".format(id))
            connection.commit()
            cursor.execute(
                "Delete FROM book_category where book_id=={};".format(id))
            connection.commit()
            cursor.execute(
                "Delete FROM book_language where book_id=={};".format(id))
            connection.commit()
            cursor.execute(
                "Delete FROM book_designer where book_id=={};".format(id))
            connection.commit()
            cursor.execute(
                "Delete FROM book_translator where book_id=={};".format(id))
            connection.commit()
            cursor.execute(
                "Delete FROM resources_book where book_id=={};".format(id))
            connection.commit()
            cursor.execute("Delete FROM books where id=={};".format(id))
            connection.commit()
            return True

    def insert(book: model.Book):

        title = book.title
        code = book.product_code
        cat = [book.categories[i].id for i in range(len(book.categories))]
        age_group = book.age_group
        release_date = book.release_date

        author = [book.authors[i].id for i in range(len(book.authors))]
        price = book.price

        language = [book.languages[i].id for i in range(len(book.languages))]
        publisher = book.publisher.id

        cover_designer = [book.cover_designers[i].id for i in range(
            len(book.cover_designers))]

        translator = [book.translators[i].id for i in range(
            len(book.translators))]

        resource = [book.resources[i].id for i in range(len(book.resources))]

        cursor.execute("INSERT INTO books (title, product_code,age_group, publisher_id, release_date, price) VALUES('{}', {}, '{}',{},'{}',{});".format(
            title, code, age_group, publisher, release_date, price))
        connection.commit()
        a = cursor.lastrowid
        for i in author:
            cursor.execute(
                "INSERT INTO book_author (`book_id`, `author_id`) VALUES({}, {});".format(a, i))
            connection.commit()
        for i in cat:
            cursor.execute(
                "INSERT INTO book_category (`book_id`, `category_id`) VALUES({}, {});".format(a, i))
            connection.commit()
        for i in cover_designer:
            cursor.execute(
                "INSERT INTO book_designer (`book_id`, `designer_id`) VALUES({}, {});".format(a, i))
            connection.commit()
        for i in language:
            cursor.execute(
                "INSERT INTO book_language (`book_id`, `language_id`) VALUES({}, {});".format(a, i))
            connection.commit()
        for i in translator:
            cursor.execute(
                "INSERT INTO book_translator (book_id, translator_id) VALUES({}, {});".format(a, i))
            connection.commit()
        for i in resource:
            cursor.execute(
                "INSERT INTO resources_book (`book_id`, `resource_id`) VALUES({}, {});".format(a, i))
            connection.commit()

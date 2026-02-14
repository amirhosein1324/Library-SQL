import LibraryDataAdapter
import model
s = model.Book.books = LibraryDataAdapter.BookDataAdapter.get_all()
print(len(s))

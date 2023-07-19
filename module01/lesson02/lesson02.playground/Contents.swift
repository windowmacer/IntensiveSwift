import UIKit

/*
 – Создать массив книг (или других предметов)
 – Найти индекс по наименованию.
 – Удалить выбранный предмет.
 – Добавить новое значение
 – В цикле вывести все предметы и к каждому предмету добавить произвольную строку.
*/

// MARK: creating array books

var books: [String] = ["The Gambler", "The Idiot", "The brothers Karamazov", "Demons", "Poor Folk"]
print(books)

// MARK: search index array

let mybook = "The brothers Karamazov"
var searchIndex = 0

for book in books {
	if book == mybook {
		print(searchIndex)
	} else {
		searchIndex += 1
	}
}

// MARK: deleting element array

let oldBook = "The Idiot"
var indexOldBook: Int?
searchIndex = 0

for book in books {
	if book == oldBook {
		indexOldBook = searchIndex
		break
	} else {
		searchIndex += 1
	}
}

if let index = indexOldBook {
	books.remove(at: index)
}

print(books)

// MARK: Add a new element array

books += ["Crime and Punishment"]

print(books)

// MARK: output all elements array

searchIndex = 1
var strIndex: String = ""

for book in books {
	strIndex = String(searchIndex)
	strIndex += ") " + book
	print(strIndex)
	searchIndex += 1
}

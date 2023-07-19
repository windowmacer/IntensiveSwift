import UIKit

/*
 1. Напишите функцию, которая может вернуть ошибку. Обработайте возможные ошибки.
 
 2. На подобие примера из методички, составьте родительский и дочерние классы и сделайте соответствующие приведения типов
 */

// MARK: Search for a non-negative even integer

enum IntErrors: Error {
	case negativeError
	case evenError
}

func serchNonNegativeInt(nub: Int) throws {
	guard (nub > 0) else {
		throw IntErrors.negativeError
	}
	guard (nub % 2 == 0) else {
		throw IntErrors.evenError
	}
	print("Проверка пройдена, \(nub) - четное неотрицательное")
}

do {
	try serchNonNegativeInt(nub: -5)
} catch IntErrors.negativeError {
	print("Ошибка, введенное значение - отрицательное или 0")
} catch IntErrors.evenError {
	print("Ошибка, введенное значение - нечетное")
}

if let _ = try? serchNonNegativeInt(nub: 4) {}

// MARK: Type conversion

class Xmen {
	var name = "X-man"
	var force: Bool = true
}

class Student: Xmen {
	var phrase = "I study!"
	func myPhrase() {
		print("Studet \(self.name): \(self.phrase)")
	}
}

class Hero: Xmen {
	var superpower = "I have a superpower"
	func myComment() {
		print("Hero \(self.name): \(self.superpower)!")
	}
}

var userOne = Student()
var userTwo = Hero()
var arrayXmen = [userOne, userTwo]

for array in arrayXmen {
	if let valueOne = array as? Hero {
		valueOne.myComment()
	} else if let valueTwo = array as? Student {
		valueTwo.myPhrase()
	} else {
		print("This is a member of the \(array.name)")
	}
}

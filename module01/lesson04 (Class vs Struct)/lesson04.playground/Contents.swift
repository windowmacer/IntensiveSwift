import UIKit

/*
 - Создайте класс любого объекта, на ваш выбор, опишите его свойства и методы
 (желательно так же в методах написать простой функционал, на ваше усмотрение).
 Сделайте инициализацию внутри класса.
 Создайте экземпляр этого класса и задайте свойства и вызовите его методы.
 
 - Опишите структурой любой объект. Создайте несколько экземпляров (несколько объектов).
 
*/

// MARK: init class

class Wizards {
	let name: String
	var age: Int16
	
	init(name: String, age: Int16) {
		self.name = name
		self.age = age
		print("I'm \(self.name)!")
	}
	
	func superpowerWizards() {
		print("You shall not pass")
	}
	func oneYearLater() {
		self.age += 1
		print("I've aged one year! My age is \(self.age)")
	}
	
	
}

var greyWizards = Wizards(name: "Gandalf", age: 64)
greyWizards.superpowerWizards()
greyWizards.oneYearLater()

// MARK: init struct

struct Hobbit {
	var age: Int16
	var height: Int16
}

var smeagol = Hobbit(age: 16, height: 100)
print("Smeagol: My age is \(smeagol.age)")
var gollum = smeagol
print("Gollum: My age is \(gollum.age)")
gollum.age += 1
print("\n\nGollum: My age is \(gollum.age)\nSmeagol: My age is \(smeagol.age)")

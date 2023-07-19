import UIKit

/*

 Подуймайте над функционалом какого нибудь приложения, и сделать под него несколько классов.
 Общие свойства и методы вынести в родительский класс и сделать правильное наследование от него.
 Обязетельно использовать инициализаторы, т.е не нужно определять свойста класса изначально.
 
*/

class Character {
	let name: String
	let race: String
	var age: UInt16
	var cash: Int = 0
	
	init(_ name: String, _ race: String, _ age: UInt16) {
		self.name = name
		self.race = race
		self.age = age
		
		print("\(self.name): Hi, my name is \(self.name)!")
	}
	
	func isMyAge() {
		if self.race == "human" {
			if self.age > 50 {
				print("\(self.name): I'm an old man!")
			} else {
				print("\(self.name): I'm young!")
			}
		} else {
			print("\(self.name): My age is \(self.age) years!")
		}
	}
	
	func updateCash(sum: Int) {
		self.cash += sum
		print("\(self.name): I have \(self.cash) coins!")
	}
}

class nonPlayer: Character {
	var title: String
	var myQuest: String?
	
	init(title: String, _ name: String, _ race: String, _ age: UInt16) {
		self.title = title
		super.init(name, race, age)
	}
	
	init(title: String, quest: String, _ name: String, _ race: String, _ age: UInt16) {
		self.title = title
		self.myQuest = quest
		super.init(name, race, age)
	}
	
	func helloWorld() {
		print("\(self.name): I'm \(self.title)!")
		self.isMyAge()
		if  let request = self.myQuest {
			print("\(self.name): My mission - \(request)! Do you help me?")
		}
	}
}

class Player: Character {
	var classPlayer: String
	var hitPoints: Int
	init(name: String, race: String, classPlayer: String, age: UInt16, myCash: Int) {
		self.classPlayer = classPlayer
		self.hitPoints = 100
		super.init(name, race, age)
		self.cash = myCash
	}
	
	func mySpeech(str: String) {
		print("\(self.name): \(str)")
	}
}

let nps = nonPlayer(title: "Lord", quest: "Need to find the key", "Tom", "human", 64)
let playerOne = Player(name: "Legolas", race: "Elf", classPlayer: "Ranger", age: 120, myCash: 300)
nps.helloWorld()
playerOne.mySpeech(str: "Yes!")
print("** gets the money (+12) **")
playerOne.updateCash(sum: 12)

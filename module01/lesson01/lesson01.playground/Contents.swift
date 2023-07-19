import UIKit

/*
 1. Создать переменные для анкет (имя, год рождения и тд). Вообще поиграться с созданием переменных, вывести их, задать разные значения
 2. Переменные наличие животных
 3. Если есть животные, вывести имя, если нет, то советующее значение
*/

// MARK: part 1

var studentName: String = "Alex"
var studentLastName: String = "Ford"
var studentAge: UInt8 = 20
let studentBirthDay: UInt8 = 19
let studentBirthMonth: UInt8 = 10
let studentBirthYear: UInt16 = 2003
let studentGender: String = "man"

print("Student: \(studentName) \(studentLastName)")
print("\(studentName) is \(studentAge) age")

var professorName: String = "John"
var professorLastName: String = "Watson"

print("\(studentName): My professor is \(professorName) \(professorLastName)")

// MARK: part 2

var studentPet: String?
var hasPet: Bool = false

// MARK: part 3

if let myPet = studentPet {
	let nameMyPet: String = "Sharik"
	print("\(studentName): My \(myPet) is name \(nameMyPet)")
} else {
	print("\(studentName): I don't have a pet yet!")
}

studentPet = "dog"
if let myPet = studentPet {
	let nameMyPet: String = "Bobik"
	print("\(studentName): My \(myPet) is name \(nameMyPet)")
} else {
	print("\(studentName): I don't have a pet yet!")
}

if hasPet == true {
	let nameMyPet: String = "Bryan"
	print("\(professorName): My pet is name \(nameMyPet)")
} else {
	print("\(professorName): I don't have a pet yet!")
}

hasPet = true
if hasPet == true {
	let nameMyPet: String = "Loly"
	print("\(professorName): My pet is name \(nameMyPet)")
} else {
	print("\(professorName): I don't have a pet yet!")
}

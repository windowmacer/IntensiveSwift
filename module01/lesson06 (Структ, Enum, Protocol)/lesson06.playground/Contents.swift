import UIKit

/*
 1. Создайте класс, с методом который принимает структуру данных и сохраните эти данные в словарь.
 В качестве ключа используйте заранее заданный enum.
 2. Создайте несколько классов, и реализуйте для них общий протокол, ограничьте протокол только классами.
*/

// MARK: use enum

enum DataSet: String {
	case caseOne = "add commit"
	case caseTwo = "push commit"
	case caseThree = "remove commit"
}

struct DataBase {
	var pathFolder = String()
	var gitSSH = String()
	var nameFile = String()
}

class ConfigDict {
	let name: String = "ConfigDictionary"
	
	func setDictory(_ structData: DataBase, _ namesCase: DataSet) -> [DataSet: DataBase] {
		var fileProject = [DataSet: DataBase]()
		fileProject[namesCase] = structData
		return fileProject
	}
}
var stVerA = DataBase(pathFolder: "/User/project",
				   gitSSH: "project/myproject.git", nameFile: "main.swift")
var confVerA = ConfigDict()
var dictoryVerA = confVerA.setDictory(stVerA, .caseThree)


// MARK: use protocol

protocol officeDocument {
	var name: String {get set}
	var nameUser: String {get set}
	
	func signatureFile(dd: Int, mm: Int, yy: Int)
}

class Passport: officeDocument {
	var name: String = "myPassport"
	var nameUser: String
	var lastnameUser: String
	var gender: String
	
	init(yourName: String, yourLastname: String, yourGender: String) {
		self.nameUser = yourName
		self.lastnameUser = yourLastname
		self.gender = yourGender
	}
	
	func signatureFile(dd: Int, mm: Int, yy: Int) {
		print("I am signing this document: \(dd)/\(mm)/\(yy)")
	}
}

class fanID: officeDocument {
	var name: String
	var nameUser: String
	
	init(yourName: String, yourClub: String) {
		self.nameUser = yourName
		self.name = yourClub
	}
	
	func signatureFile(dd: Int, mm: Int, yy: Int) {
		print("I'm going to the \(self.name) game \(dd).\(mm).\(yy)")
	}
}

var classA = Passport(yourName: "Tom", yourLastname: "Ress", yourGender: "M")
classA.signatureFile(dd: 25, mm: 05, yy: 23)
var classB = fanID(yourName: "Nik", yourClub: "Barca")
classB.signatureFile(dd: 30, mm: 06, yy: 23)

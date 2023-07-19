//
//  StudentData.swift
//  lessons03
//
//  Created by Кирилл Арефьев on 25.06.2023.
//

import Foundation

class StudentData {
	private var name: String?
	private var age: Int32?
	private var email: String?
	private var about: String?
	
	func getDataName() -> String {
		if let name = self.name {
			if name.isEmpty {
				return "*пусто*"
			}
			return name
		} else {
			return "*пусто*"
		}
	}
	
	func getDataAge() -> String {
		if let age = self.age {
			return String(age)
		} else {
			return "*пусто*"
		}
	}
	
	func getDataMail() -> String {
		if let mail = self.email {
			if mail.isEmpty {
				return "*пусто*"
			}
			return mail
		} else {
			return "*пусто*"
		}
	}
	
	func getDataAbout() -> String {
		if let about = self.about {
			if about.isEmpty {
				return "*пусто*"
			}
			return about
		} else {
			return "*необязательно*"
		}
	}
	
	func setDataName(_ name: String?) {
		if let data = name {
			self.name = data
		}
	}
	func setDataAge(_ age: String?) {
		if let data = age {
			self.age = Int32(data)
		}
	}
	func setDataMail(_ mail: String?) {
		if let data = mail {
			self.email = data
		}
	}
	func setDataAbout(_ about: String?) {
		if let data = about {
			self.about = data
		}
	}
}

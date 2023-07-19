//
//  SecondViewController.swift
//  lessons03
//
//  Created by Кирилл Арефьев on 25.06.2023.
//

import UIKit

class SecondViewController: UIViewController {
	
	lazy var student = StudentData()

	lazy var nameLabel = UILabel()
	lazy var ageLabel = UILabel()
	lazy var emailLabel = UILabel()
	lazy var aboutLabel = UILabel()
	
	lazy var nameField = UITextField()
	lazy var ageField = UITextField()
	lazy var emailField = UITextField()
	lazy var aboutField = UITextField()
	
	var delegate: ViewDelegate!
	
	lazy var textLabel: UILabel = {
		let label = UILabel()
		label.frame = CGRect(x: 25, y: 10, width: 300, height: 200)
		label.text = "Ввести данные"
		label.textColor = .white
		label.font = UIFont(name: "Thonburi-Bold", size: 32)
		return label
	}()
	
	lazy var saveButton: UIButton = {
		let button = UIButton()
		button.frame = CGRect(x: 50, y: 580, width: 300, height: 50)
		button.center.x = view.center.x
		button.setTitle("Сохранить", for: .normal)
		button.setTitle("", for: .highlighted)
		button.setTitleColor(.black, for: .normal)
		button.backgroundColor = .white
		button.layer.cornerRadius = 20
		button.addTarget(self, action: #selector(passData), for: .touchUpInside)
		return button
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = #colorLiteral(red: 0.01960784314, green: 0.2823529412, blue: 0.4352941176, alpha: 1)
		view.addSubview(textLabel)
		view.addSubview(saveButton)
		
		let labels = [nameLabel, ageLabel, emailLabel, aboutLabel]
		nameLabel.text = "name: "
		ageLabel.text = "age: "
		emailLabel.text = "email: "
		aboutLabel.text = "about: "
		settingLabel(labels: labels)
		for label in labels {
			view.addSubview(label)
		}
		
		let fields = [nameField, ageField, emailField, aboutField]
		settingField(fields: fields)
		for field in fields {
			view.addSubview(field)
		}
	}

	func settingLabel(labels: [UILabel]) {
		var i = 130
		for label in labels {
			label.font = UIFont(name: "Thonburi", size: 18)
			label.frame = CGRect(x: 25, y: i, width: 100, height: 50)
			label.textColor = .white
			i += 100
		}
	}
	
	func settingField(fields: [UITextField]) {
		var i = 180
		for field in fields {
			field.frame = CGRect(x: 25, y: i, width: 300, height: 50)
			field.center.x = view.center.x
			field.backgroundColor = .white
			field.layer.cornerRadius = 20
			i += 100
		}
	}
	
	@objc func passData() {
		student.setDataName(nameField.text)
		student.setDataAge(ageField.text)
		student.setDataMail(emailField.text)
		student.setDataAbout(aboutField.text)
		delegate.saveData(container: student)
	}

}

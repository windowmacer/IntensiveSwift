//
//  ViewController.swift
//  lessons03
//
//  Created by Кирилл Арефьев on 21.06.2023.
//

import UIKit

protocol ViewDelegate {
	func saveData(container: StudentData)
}

class ViewController: UIViewController {
	
	lazy var nameLabel = UILabel()
	lazy var ageLabel = UILabel()
	lazy var emailLabel = UILabel()
	lazy var aboutLabel = UILabel()
	
	lazy var nameText = UILabel()
	lazy var ageText = UILabel()
	lazy var emailText = UILabel()
	lazy var aboutText = UILabel()
	
	lazy var student = StudentData()
	
	lazy var textLabel: UILabel = {
		let label = UILabel()
		label.frame = CGRect(x: 25, y: 10, width: 300, height: 200)
		label.text = "Личные данные"
		label.textColor = .white
		label.font = UIFont(name: "Thonburi-Bold", size: 32)
		return label
	}()
	
	lazy var transitionButton: UIButton = {
		let button = UIButton()
		button.frame = CGRect(x: 50, y: 550, width: 300, height: 50)
		button.center.x = view.center.x
		button.setTitle("Ввести данные", for: .normal)
		button.setTitle("", for: .highlighted)
		button.setTitleColor(.black, for: .normal)
		button.backgroundColor = .white
		button.layer.cornerRadius = 20
		button.addTarget(self, action: #selector(registration), for: .touchUpInside)
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = #colorLiteral(red: 0.01960784314, green: 0.2823529412, blue: 0.4352941176, alpha: 1)
		view.addSubview(textLabel)
		view.addSubview(transitionButton)
		
		let labels = [nameLabel, ageLabel, emailLabel, aboutLabel]
		
		nameLabel.text = "name: "
		ageLabel.text = "age: "
		emailLabel.text = "email: "
		aboutLabel.text = "about: "
		addLabels(labels: labels)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		let texts = [nameText, ageText, emailText, aboutText]
		
		nameText.text = student.getDataName()
		ageText.text = student.getDataAge()
		emailText.text = student.getDataMail()
		aboutText.text = student.getDataAbout()
		addTexts(texts: texts)
	}

	@objc func registration() {
		let secondView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")
		self.navigationController?.pushViewController(secondView, animated: true)
		if let viewSC = secondView as? SecondViewController {
			viewSC.delegate = self
		}

	}

}

extension ViewController {
	func addLabels(labels: [UILabel]) {
		var i = 200
		for label in labels {
			label.font = UIFont(name: "Thonburi", size: 18)
			label.frame = CGRect(x: 25, y: i, width: 100, height: 50)
			label.textColor = .white
			view.addSubview(label)
			i += 50
		}
	}
}

extension ViewController {
	func addTexts(texts: [UILabel]) {
		var i = 200
		for text in texts {
			text.font = UIFont(name: "Thonburi", size: 18)
			text.frame = CGRect(x: 100, y: i, width: 200, height: 50)
			text.textColor = .white
			text.numberOfLines = 0
			view.addSubview(text)
			i += 50
		}
	}
}

extension ViewController: ViewDelegate {
	func saveData(container: StudentData) {
		student = container
	}
}


//
//  ViewController.swift
//  lesson10
//
//  Created by Кирилл Арефьев on 20.06.2023.
//

import UIKit

class ViewController: UIViewController {
	var phrases = Phrases()
	lazy var adviceLabel: UILabel = {
		let textDay = UILabel()
		textDay.text = "Факт дня"
		textDay.frame = CGRect(x: 0, y: 58, width: Int(view.frame.width), height: 36)
		textDay.textAlignment = .center
		textDay.textColor = .white
		textDay.font = UIFont(name: "Thonburi-Bold", size: 30)
		return textDay
	}()
	
	lazy var textLabel: UILabel = {
		let textBody = UILabel()
		textBody.text = phrases.getPhrases()
		textBody.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
		textBody.center = view.center
		textBody.textAlignment = .center
		textBody.numberOfLines = 0
		textBody.lineBreakMode = .byWordWrapping
		textBody.textColor = .white
		textBody.font = UIFont(name: "Thonburi", size: 20)
		return textBody
	}()
	
	lazy var switchButton: UIButton = {
		let button = UIButton()
		button.setTitle("Показать", for: .normal)
		button.setTitle("", for: .highlighted)
		button.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
		button.backgroundColor = .white
		button.layer.backgroundColor = UIColor(red: 0, green: 0.7, blue: 0.154, alpha: 1).cgColor
		button.layer.cornerRadius = 20
		button.center.x = view.center.x
		button.center.y = view.center.y + 200
		button.addTarget(self, action: #selector(touchAddButton(button: )), for: .touchUpInside)
		return button
	}()
	
	lazy var addButton: UIButton = {
		let thisButton = UIButton()
		thisButton.setTitle("Добавить", for: .normal)
		thisButton.setTitle("", for: .highlighted)
		thisButton.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
		thisButton.tintColor = .white
		thisButton.center.x = view.center.x
		thisButton.center.y = view.center.y + 270
		return thisButton
	}()
	@objc func touchAddButton(button: UIButton) {
		textLabel.text = phrases.getPhrases()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = #colorLiteral(red: 0.2030155063, green: 0.2030155063, blue: 0.2030155063, alpha: 1)
		view.addSubview(adviceLabel)
		view.addSubview(textLabel)
		view.addSubview(switchButton)
		view.addSubview(addButton)
	}


}


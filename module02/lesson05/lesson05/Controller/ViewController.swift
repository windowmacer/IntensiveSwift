//
//  ViewController.swift
//  lesson05
//
//  Created by Кирилл Арефьев on 07.07.2023.
//

import UIKit

class ViewController: UIViewController {
	
	private let appView = AppView()
	private let cardView = UIView()
	
	private let imagesTop = ["image1", "image2"]
	private let imagesBottom = ["image3", "image4"]
	
	private let headerStack = UIStackView()
	private let headerSubStackOne = UIStackView()
	private let headerSubStackTwo = UIStackView()
	private let headerSubStackImageTop = UIStackView()
	private let headerSubStackImageBottom = UIStackView()
	
	private let textStack = UIStackView()
	private let imageStack = UIStackView()
	
	private lazy var nextButton: UIButton = {
		let button = UIButton()
		button.setTitle("next", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = UIColor(named: "GreenButton")
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		button.layer.cornerRadius = 20
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(named: "GreyMain")
		view.addSubview(headerStack)
		view.addSubview(cardView)
		view.addSubview(imageStack)
		view.addSubview(nextButton)
		
		addHeader()
		addCardView()
		addImageStack()
		addNextButton()
		
	}
	
	private func addHeader() {
		addLabelTop()
		addImage()
		
		headerStack.axis = .horizontal
		headerStack.alignment = .top
		headerStack.distribution = .equalSpacing
		headerStack.translatesAutoresizingMaskIntoConstraints = false
		
		headerStack.addArrangedSubview(headerSubStackOne)
		headerStack.addArrangedSubview(headerSubStackTwo)
		
		NSLayoutConstraint.activate([
			headerStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 37),
			headerStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			headerStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
		])
	}
	
	private func addLabelTop() {
		let nameMoto = appView.labelApp(text: "MotoApp", fontSize: 32, weight: .bold, color: "WhiteMain")
		let nameDescription = appView.labelApp(text: "description", color: "GreyLabel")
		
		headerSubStackOne.axis = .vertical
		headerSubStackOne.alignment = .fill
		headerSubStackOne.distribution = .equalSpacing
		
		headerSubStackOne.addArrangedSubview(nameMoto)
		headerSubStackOne.addArrangedSubview(nameDescription)
	}
	
	private func addImage() {
		addImageTop()
		addImageBottom()
		
		headerSubStackTwo.axis = .vertical
		headerSubStackTwo.alignment = .center
		headerSubStackTwo.distribution = .equalSpacing
		
		headerSubStackTwo.addArrangedSubview(headerSubStackImageTop)
		headerSubStackTwo.addArrangedSubview(headerSubStackImageBottom)
	}
	
	private func addImageTop() {
		
		imagesTop.forEach{ img in
			let image = appView.getImage(img: img)
			headerSubStackImageTop.addArrangedSubview(image)
		}
		headerSubStackImageTop.axis = .horizontal
		headerSubStackImageTop.alignment = .fill
		headerSubStackImageTop.distribution = .equalSpacing
	}
	
	private func addImageBottom() {
		imagesBottom.forEach{ img in
			let image = appView.getImage(img: img)
			headerSubStackImageBottom.addArrangedSubview(image)
		}
		headerSubStackImageBottom.axis = .horizontal
		headerSubStackImageBottom.alignment = .fill
		headerSubStackImageBottom.distribution = .equalSpacing
	}
	
	private func addCardView() {
		
		cardView.backgroundColor = .white
		cardView.layer.cornerRadius = 20
		cardView.translatesAutoresizingMaskIntoConstraints = false
		
		cardView.addSubview(textStack)
		addTextStack()
		
		NSLayoutConstraint.activate([
			cardView.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 34),
			cardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			cardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
		])
	}
	
	private func addTextStack() {
		
		let modelText = appView.labelApp(text: "gt-500", weight: .bold)
		let mainText = appView.labelApp(text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod")
		mainText.numberOfLines = 0
		
		textStack.axis = .vertical
		textStack.alignment = .leading
		textStack.distribution = .equalSpacing
		
		textStack.addArrangedSubview(modelText)
		textStack.addArrangedSubview(mainText)
		
		textStack.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			textStack.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 22),
			textStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 15),
			textStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
			textStack.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -19)
		])
	}
	
	private func addImageStack() {
		let imageOne = appView.getImage(img: "image1", w: 171, h: 168, r: 20)
		let imageTwo = appView.getImage(img: "image4", w: 171, h: 168, r: 20)
		
		imageStack.addArrangedSubview(imageOne)
		imageStack.addArrangedSubview(imageTwo)
		
		imageStack.axis = .horizontal
		imageStack.distribution = .equalSpacing
		imageStack.alignment = .fill
		imageStack.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			imageStack.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 22),
			imageStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			imageStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
		])
		
	}
	
	private func addNextButton() {
		nextButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
			nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			nextButton.heightAnchor.constraint(equalToConstant: 62)
		])
	}
}


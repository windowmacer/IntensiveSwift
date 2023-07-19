//
//  DataCell.swift
//  lesson07
//
//  Created by Кирилл Арефьев on 18.07.2023.
//

import UIKit

class DataCell: UITableViewCell {
	
	private let mainStack = UIStackView()
	private let textStack = UIStackView()
	
	var userName = UILabel()
	var userMessege = UILabel()
	var userImage = UIImageView()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		getImage()
		setupTextStack()
		setupMainStack()
	}
	
	private func setupTextStack() {
		self.contentView.addSubview(textStack)
		textStack.axis = .vertical
		textStack.alignment = .leading
		textStack.spacing = 10
		textStack.distribution = .equalSpacing
		
		userName.font = .boldSystemFont(ofSize: 16)
		userName.numberOfLines = 0
		userMessege.numberOfLines = 0
		
		textStack.addArrangedSubview(userName)
		textStack.addArrangedSubview(userMessege)
	}
	
	private func setupMainStack() {
		self.contentView.addSubview(mainStack)
		mainStack.axis = .horizontal
		mainStack.spacing = 20
		
		mainStack.addArrangedSubview(userImage)
		mainStack.addArrangedSubview(textStack)
		
		mainStack.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func getImage(w: CGFloat = 60, h: CGFloat = 60, r: CGFloat = 15) {
		userImage.translatesAutoresizingMaskIntoConstraints = false
		
		userImage.widthAnchor.constraint(equalToConstant: w).isActive = true
		userImage.heightAnchor.constraint(equalToConstant: h).isActive = true
		userImage.layer.cornerRadius = r
		userImage.contentMode = .scaleAspectFill
		userImage.clipsToBounds = true
	}
	
}

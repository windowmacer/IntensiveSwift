//
//  TableCell.swift
//  lesson02
//
//  Created by Кирилл Арефьев on 11.08.2023.
//

import UIKit

class TableCell: UITableViewCell {
	
	private var hStack = UIStackView()
	
	var titleLabel = UILabel()
	var descriptionLabel = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setTitleTable()
	}
	
	func setTitleTable() {
		self.contentView.addSubview(hStack)
		hStack.axis = .vertical
		hStack.alignment = .leading
		hStack.spacing = 10
		hStack.distribution = .equalSpacing
		
		titleLabel.font = .boldSystemFont(ofSize: 16)
		titleLabel.numberOfLines = 0
		
		descriptionLabel.font = .systemFont(ofSize: 14)
		descriptionLabel.numberOfLines = 0
		
		hStack.addArrangedSubview(titleLabel)
		hStack.addArrangedSubview(descriptionLabel)
		
		hStack.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

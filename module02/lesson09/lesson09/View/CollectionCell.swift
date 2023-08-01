//
//  CollectionCell.swift
//  lesson09
//
//  Created by Кирилл Арефьев on 29.07.2023.
//

import UIKit

class CollectionCell: UICollectionViewCell {
	
	private var story = UIImageView()
	private var label = UILabel()
	
	func setupCell(image: String) {
		story.image = UIImage(named: image)
		story.contentMode = .scaleAspectFill
		story.clipsToBounds = true
		
		contentView.addSubview(story)
		
		story.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			story.topAnchor.constraint(equalTo: contentView.topAnchor),
			story.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			story.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			story.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
		])
	}
	
	func setTextLabel(text: String) {
		label.text = text
		label.font = .systemFont(ofSize: 20)
		label.textColor = .black
		label.textAlignment = .center
		label.numberOfLines = 0
		label.backgroundColor = UIColor(white: 1, alpha: 0.75)
		
		contentView.addSubview(label)
		
		label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			label.heightAnchor.constraint(equalToConstant: CGFloat(Int(contentView.frame.height / 11)))
		])
	}
}

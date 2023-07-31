//
//  CollectionCell.swift
//  lesson09
//
//  Created by Кирилл Арефьев on 29.07.2023.
//

import UIKit

class CollectionCell: UICollectionViewCell {
	
	private var story = UIImageView()
	
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
}

//
//  CollectionViewCell.swift
//  lesson08
//
//  Created by Кирилл Арефьев on 04.11.2023.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
	private var imageView = UIImageView()
	
	func getImage(image: UIImage) {
		imageView.image = image
		imageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			imageView.widthAnchor.constraint(equalToConstant: self.frame.width),
			imageView.heightAnchor.constraint(equalToConstant: self.frame.height)
		])
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 10
		self.contentView.addSubview(imageView)
	}
}

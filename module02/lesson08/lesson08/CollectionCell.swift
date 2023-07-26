//
//  CollectionCell.swift
//  lesson08
//
//  Created by Кирилл Арефьев on 26.07.2023.
//

import UIKit

class CollectionCell: UICollectionViewCell {
	var imageMovie = UIImageView()
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func getImage() {
		imageMovie.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			imageMovie.widthAnchor.constraint(equalToConstant: self.frame.width),
			imageMovie.heightAnchor.constraint(equalToConstant: self.frame.height)
		])
		imageMovie.contentMode = .scaleAspectFill
		imageMovie.clipsToBounds = true
		imageMovie.layer.cornerRadius = 10
		
		self.contentView.addSubview(imageMovie)
	}

}

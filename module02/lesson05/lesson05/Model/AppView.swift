//
//  AppView.swift
//  lesson05
//
//  Created by Кирилл Арефьев on 08.07.2023.
//

import UIKit

class AppView {
	func labelApp(text: String, fontSize: CGFloat = 16, weight: UIFont.Weight = .regular, color: String = "BlackMain") -> UILabel {
		let label = UILabel()
		label.text = text
		label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
		label.textColor = UIColor(named: color)
		return label
	}
	
	func getImage(img: String, w: CGFloat = 70, h: CGFloat = 70, r: CGFloat = 35) -> UIImageView {
		let image = UIImageView()
		image.image = UIImage(named: img)
		image.translatesAutoresizingMaskIntoConstraints = false
		
		image.widthAnchor.constraint(equalToConstant: w).isActive = true
		image.heightAnchor.constraint(equalToConstant: h).isActive = true
		image.layer.cornerRadius = r
		image.clipsToBounds = true
		
		return image
	}
}

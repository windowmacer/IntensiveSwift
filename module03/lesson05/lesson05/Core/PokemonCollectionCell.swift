//
//  PokemonCollectionCell.swift
//  lesson05
//
//  Created by Кирилл Арефьев on 27.08.2023.
//

import UIKit

class PokemonCollectionCell: UICollectionViewCell {
	
	private var pokemonNumberLabel: UILabel?
	private var pokemonNameLabel = UILabel()
	private var pokemonImageView: UIImageView?
	private var pokemonType: UICollectionView?
	
	func setup(name: String) {
		contentView.backgroundColor = .red
		contentView.layer.cornerRadius = 15
		
		contentView.addSubview(pokemonNameLabel)
		pokemonNameLabel.text = name
		pokemonNameLabel.font = .systemFont(ofSize: 16)
		pokemonNameLabel.textColor = .white
		
		pokemonNameLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			pokemonNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			pokemonNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
			pokemonNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			pokemonNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
		])

		
		
	}
}

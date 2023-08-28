//
//  ViewController.swift
//  lesson05
//
//  Created by Кирилл Арефьев on 27.08.2023.
//

import UIKit

class ViewController: UIViewController {
	private var pokemonCollection: UICollectionView!
	
	private var widthPokemonCell = CGFloat()

	let realmManager = RealmManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		widthPokemonCell = view.bounds.width - 20
		setupPokemonCollection()
	}
	
	private func setupPokemonCollection() {
		
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 10
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		
		pokemonCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		pokemonCollection.register(PokemonCollectionCell.self, forCellWithReuseIdentifier: "cell")
		pokemonCollection.delegate = self
		pokemonCollection.dataSource = self
		
		view.addSubview(pokemonCollection)
		pokemonCollection.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			pokemonCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			pokemonCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			pokemonCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			pokemonCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addNode))
	}
	
	@objc func addNode() {
		let alert = UIAlertController(title: "Add new pokemon", message: nil, preferredStyle: .alert)
		
		alert.addTextField { titleField in
			titleField.placeholder = "Name pokemon"
		}
		alert.addTextField { contentText in
			contentText.placeholder = "Type pokemon"
		}
		
		let okeyButton = UIAlertAction(title: "Save", style: .default) { _ in
			if let name = alert.textFields?[0].text, let type = alert.textFields?[1].text {
				let card = Card()
				card.name = name
				card.type = type
				self.realmManager.createCard(newCard: card)
				self.pokemonCollection.reloadData()
			}
		}
		let cancelButton = UIAlertAction(title: "Close", style: .destructive)
		
		alert.addAction(okeyButton)
		alert.addAction(cancelButton)
		present(alert, animated: true)
	}
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		realmManager.allCards?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PokemonCollectionCell
		cell.setup(name: realmManager.allCards?[indexPath.row].name ?? "")
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: widthPokemonCell, height: 150)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if let id = realmManager.allCards?[indexPath.row].id {
			realmManager.deleteCard(id: id)
			pokemonCollection.deleteItems(at: [indexPath])
		}
	}
		
}


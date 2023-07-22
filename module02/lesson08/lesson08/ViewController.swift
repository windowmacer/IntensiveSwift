//
//  ViewController.swift
//  lesson08
//
//  Created by Кирилл Арефьев on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {
	
	var collection: UICollectionView!
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .darkGray
		collectionSetup()
	}

	private func collectionSetup() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 12
		layout.minimumInteritemSpacing = 12
		layout.itemSize = CGSize(width: 160, height: 90)
		
		collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
		collection.dataSource = self
		collection.delegate = self
		collection.backgroundColor = .gray
		collection.layer.cornerRadius = 10
		
		collection.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(collection)
		
		NSLayoutConstraint.activate([
			collection.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			collection.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
			collection.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			collection.heightAnchor.constraint(equalToConstant: 200),
		])
	}
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
		
		cell.contentView.backgroundColor = .white
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 320, height: 180)
	}
	
	
}

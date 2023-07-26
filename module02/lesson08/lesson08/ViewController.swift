//
//  ViewController.swift
//  lesson08
//
//  Created by Кирилл Арефьев on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {
	
	var collection: UICollectionView!
	
	var heightCollection = CGFloat()
	var widthCollection = CGFloat()
	var heightCell = CGFloat()
	var widthCell = CGFloat()
	
	var deltaH = CGFloat()
	var deltaW = CGFloat()
	var data = structImage()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .darkGray
		title = "Movies"
		navigationController?.navigationBar.prefersLargeTitles = true
		sizeCollectionSetup()
		collectionSetup()
	}

	
	// MARK: Setup Collection One
	
	private func collectionSetup() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = deltaW * 2
		layout.minimumInteritemSpacing = deltaH * 2
		layout.itemSize = CGSize(width: widthCollection, height: heightCollection)
		
		collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collection.register(CollectionCell.self, forCellWithReuseIdentifier: "cell")
		collection.dataSource = self
		collection.delegate = self
		collection.isPagingEnabled = true
		collection.backgroundColor = .gray
		collection.layer.cornerRadius = 10
		
		collection.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(collection)
		
		NSLayoutConstraint.activate([
			collection.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			collection.widthAnchor.constraint(equalToConstant: widthCollection),
			collection.heightAnchor.constraint(equalToConstant: heightCollection),
			collection.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
		])
	}
	
	private func sizeCollectionSetup() {
		widthCollection = view.frame.width - 20
		heightCollection = widthCollection * (9 / 16)
		
		widthCell = widthCollection * 0.9
		heightCell = heightCollection * 0.9
		
		deltaH = (heightCollection - heightCell) / 2
		deltaW = (widthCollection - widthCell) / 2
		
		deltaH = (deltaH * 10 - 2).rounded() / 10
		deltaW = (deltaW * 10 - 2).rounded() / 10
	}
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		data.dataMovie.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
		
		cell.contentView.backgroundColor = .white
		cell.contentView.layer.cornerRadius = 10
		cell.imageMovie.image = UIImage(named: data.dataMovie[indexPath.row])
		cell.getImage()
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: widthCell, height: heightCell)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
			return(UIEdgeInsets(top: deltaH, left: deltaW, bottom: deltaH, right: deltaW))
	}
	
}

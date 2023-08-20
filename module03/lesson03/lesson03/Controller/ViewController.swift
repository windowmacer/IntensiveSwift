//
//  ViewController.swift
//  lesson03
//
//  Created by Кирилл Арефьев on 15.08.2023.
//

import UIKit

class ViewController: UIViewController {
	
	var heightCollection = CGFloat()
	var widthCollection = CGFloat()
	var heightCell = CGFloat()
	var widthCell = CGFloat()
	
	var deltaH = CGFloat()
	var deltaW = CGFloat()
	
	private var collectionView: UICollectionView!
	private var arrayNews: [Article] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		ManagerAPI.shared.getURL(value: "microsoft") { news in
			if let array = news.articles {
				self.arrayNews = array
			}
			self.collectionView.reloadData()
		}
		view.backgroundColor = .systemBackground
		sizeCollectionSetup()
		settupCollection()
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
	
	private func settupCollection() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = deltaW * 2
		layout.minimumInteritemSpacing = deltaH * 2
		layout.itemSize = CGSize(width: widthCollection, height: heightCollection)
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "cell")
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.backgroundColor = .white
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(collectionView)
		
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
			collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		self.arrayNews.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
		
		cell.contentView.backgroundColor = .systemGray.withAlphaComponent(0.35)
		cell.contentView.layer.cornerRadius = 15
		cell.setupCollectionCell(title: arrayNews[indexPath.row].title, author: arrayNews[indexPath.row].author, data: arrayNews[indexPath.row].publishedAt, context: arrayNews[indexPath.row].description)
		
		return cell
	}
	
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//		return CGSize(width: widthCell, height: heightCell)
//	}
//	
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//		return(UIEdgeInsets(top: deltaH, left: deltaW, bottom: deltaH, right: deltaW))
//	}

	
}

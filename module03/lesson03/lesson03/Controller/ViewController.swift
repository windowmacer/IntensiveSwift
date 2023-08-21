//
//  ViewController.swift
//  lesson03
//
//  Created by Кирилл Арефьев on 15.08.2023.
//

import UIKit
import SDWebImage

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
		sizeCollectionSetup()
		settupCollection()
	}
	
	private func sizeCollectionSetup() {
		widthCollection = view.bounds.width - 40
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
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "cell")
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.backgroundColor = .white
		
		self.view.addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
			collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
		])
	}
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		self.arrayNews.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
		
		cell.contentWidth = widthCollection
		cell.contentView.backgroundColor = .systemGray.withAlphaComponent(0.35)
		cell.contentView.layer.cornerRadius = 15
		
		if let imageURL = arrayNews[indexPath.row].urlToImage {
			cell.contentHeight = heightCollection
			cell.imageViewTitle.sd_setImage(with: URL(string: imageURL))
		}
		cell.setupCollectionCell(title: arrayNews[indexPath.row].title, author: arrayNews[indexPath.row].author, data: arrayNews[indexPath.row].publishedAt, context: arrayNews[indexPath.row].description)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return(UIEdgeInsets(top: deltaH, left: deltaW, bottom: deltaH, right: deltaW))
	}

	
}

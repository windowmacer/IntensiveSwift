//
//  ViewController.swift
//  lesson09
//
//  Created by Кирилл Арефьев on 01.09.2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
	private var collectionView: UICollectionView!
	private var arrayNews: [Article] = []
	
// MARK: function

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black
//		
//		navigationItem.title = "News"
//		navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.7215686275, green: 0.7215686275, blue: 0.7216146588, alpha: 1)]
//		navigationController?.navigationBar.prefersLargeTitles = true
//		navigationController?.hidesBarsOnSwipe = true
//		
//		if let tabBar = self.tabBarController?.tabBar {
//			tabBar.barTintColor = .black
//		}
		setupCollectionView()
		
		ManagerAPI.shared.getURL(value: "Apple") { news in
			if let array = news.articles {
				self.arrayNews = array
			}
			self.collectionView.reloadData()
		}
	}
	
	
	private func setupCollectionView() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 10
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.register(NewsCollectionCell.self, forCellWithReuseIdentifier: "cell")
		
		collectionView.contentInsetAdjustmentBehavior = .automatic
		
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.backgroundColor = #colorLiteral(red: 0.1019608006, green: 0.1019608006, blue: 0.1019608006, alpha: 1)
		
		view.addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: view.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
		])
	}
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		arrayNews.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)  as! NewsCollectionCell
		cell.widthAnchorCell = view.bounds.width - 20
		if let imageURL = arrayNews[indexPath.row].urlToImage {
			cell.imageNews.sd_setImage(with: URL(string: imageURL))
		}
		cell.getNews(title: arrayNews[indexPath.row].title, author: arrayNews[indexPath.row].author, date: arrayNews[indexPath.row].publishedAt, context: arrayNews[indexPath.row].description)
		cell.addButton()
//		cell.layoutIfNeeded()
		return cell
	}
	
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//			return(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
//		}
	
}

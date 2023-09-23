//
//  SavedNewsViewController.swift
//  lesson09
//
//  Created by Кирилл Арефьев on 01.09.2023.
//

import UIKit

class SavedNewsViewController: UIViewController {
	private var savedCollection: UICollectionView!
	
// MARK: function

    override func viewDidLoad() {
        super.viewDidLoad()
//		if let tabBar = self.tabBarController?.tabBar {
//			tabBar.barTintColor = .black
//		}
//		navigationItem.title = "My saves"
//		navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.7215686275, green: 0.7215686275, blue: 0.7216146588, alpha: 1)]
//		navigationController?.navigationBar.prefersLargeTitles = true
//		navigationController?.hidesBarsOnSwipe = true
//		
		setupSavedCollection()
		savedCollection.reloadData()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.savedCollection.reloadData()
	}
	
	private func setupSavedCollection() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 10
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		
		savedCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		savedCollection.register(NewsCollectionCell.self, forCellWithReuseIdentifier: "cell")
		savedCollection.dataSource = self
		savedCollection.delegate = self
		savedCollection.backgroundColor = #colorLiteral(red: 0.1019608006, green: 0.1019608006, blue: 0.1019608006, alpha: 1)
		
		savedCollection.contentInsetAdjustmentBehavior = .automatic
		
		view.addSubview(savedCollection)
		savedCollection.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			savedCollection.topAnchor.constraint(equalTo: view.topAnchor),
			savedCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			savedCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			savedCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor)
		])
	}

}

extension SavedNewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return RealmManager.shared.notes.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsCollectionCell
		cell.widthAnchorCell = view.bounds.width - 20
		
//		cell.noteNews = RealmManager.shared.notes[indexPath.row]
		
		if let imageData = RealmManager.shared.notes[indexPath.row].imageData {
			let image = UIImage(data: imageData)
			cell.imageNews.image = image
		}
		
		cell.getNews(title: RealmManager.shared.notes[indexPath.row].title, author: RealmManager.shared.notes[indexPath.row].author, date: RealmManager.shared.notes[indexPath.row].dateNews, context: RealmManager.shared.notes[indexPath.row].textNews)
		cell.deleteButton()
		
		cell.openClosures = { [weak self] in
			if let controller = self {
				RealmManager.shared.deleteNote(note: RealmManager.shared.notes[indexPath.row])
				// MARK: - если убрать, то ошибок нет.
				controller.savedCollection.reloadData()
			}
		}

		
//		cell.layoutIfNeeded()
		return cell

	}
	
	
}

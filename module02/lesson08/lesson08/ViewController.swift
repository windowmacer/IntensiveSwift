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
		collectionSetup()
	}

	private func collectionSetup() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 0
		layout.minimumInteritemSpacing = 0
		layout.itemSize = CGSize(width: 100, height: 100)
		
		collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		self.view.addSubview(collection)
	}
}


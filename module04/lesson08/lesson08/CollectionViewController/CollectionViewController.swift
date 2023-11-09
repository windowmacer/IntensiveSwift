//
//  CollectionViewController.swift
//  lesson08
//
//  Created by Кирилл Арефьев on 31.10.2023.
//

import SwiftUI

struct CollectionViewController: UIViewControllerRepresentable {
	
	@Binding var imagesCollectionView: [UIImage?]
	
	func  makeUIViewController(context: Context) -> some UIViewController {
		let collection = UICollectionViewController()
		
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 10
		layout.itemSize = CGSize(width: 210, height: 130)
		
		collection.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		
		collection.collectionView.delegate = context.coordinator
		collection.collectionView.dataSource = context.coordinator
		
		collection.collectionView.isPagingEnabled = true
		
		collection.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
		
		return collection
	}
	
	func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
		if let collection = uiViewController as? UICollectionViewController {
			collection.collectionView.reloadData()
		}
	}
	
	func makeCoordinator() -> CollectionView {
		CollectionView(object: self)
	}
	
	final class CollectionView: NSObject, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
		
		var object: CollectionViewController
		
		init(object: CollectionViewController) {
			self.object = object
		}
		
		func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
			object.imagesCollectionView.count
		}
		
		func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
			if let image = object.imagesCollectionView[indexPath.row] {
				cell.getImage(image: image)
			}
			cell.contentView.layer.cornerRadius = 10
			return cell
		}
		
		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
					return(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
			}
	}
}

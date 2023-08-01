//
//  ViewController.swift
//  lesson09
//
//  Created by Кирилл Арефьев on 29.07.2023.
//

import UIKit

class ViewController: UIViewController {
	
	private var collectionView: UICollectionView!
	private var mainColor: UIColor = .gray
	
	private var arrayImage = ["image1", "image2", "image3", "image4", "image5"]
	private var arrayText = ["Александр Блок", "Бесцельный путь синеет предо мной,", "Далекий путь, потоками изрытый,", "А дальше — мрак и в этом мраке скрытый,", "Парит судеб Вершитель роковой."]
	
	lazy var pager: UIPageControl = {
		let pager = UIPageControl()
		pager.numberOfPages = arrayImage.count
		pager.pageIndicatorTintColor = .black
		pager.currentPageIndicatorTintColor = .white
		pager.backgroundColor = UIColor(white: 1, alpha: 0.5)
		pager.layer.cornerRadius = CGFloat(Int(view.frame.height / 44))
		pager.isEnabled = false
		
		return pager
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = mainColor
		setupCollectionView()
		setupPager()
	}
	
	private func setupPager() {
		view.addSubview(pager)
		
		pager.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			pager.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: (view.frame.height / -8)),
			pager.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			pager.heightAnchor.constraint(equalToConstant: CGFloat(Int(view.frame.height / 22)))
		])
	}
	
	private func setupCollectionView() {
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 0
		layout.minimumLineSpacing = 0

		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		view.addSubview(collectionView)
		
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.contentInsetAdjustmentBehavior = .never
		collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "slide")
		collectionView.isPagingEnabled = true
		collectionView.backgroundColor = .black
		
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate ([
			collectionView.topAnchor.constraint(equalTo: view.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
		])
	}
}


extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		arrayImage.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slide", for: indexPath) as! CollectionCell

		cell.setupCell(image: arrayImage[indexPath.row])
		cell.setTextLabel(text: arrayText[indexPath.row])
		return cell
	}
}

extension ViewController: UICollectionViewDelegate {
	func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
		let pagerNum = round(scrollView.contentOffset.x / scrollView.frame.size.width)
		pager.currentPage = Int(pagerNum)
	}
}

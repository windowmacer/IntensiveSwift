//
//  ViewController.swift
//  lesson02
//
//  Created by Кирилл Арефьев on 07.08.2023.
//

import UIKit

class ViewController: UIViewController {

	private var tableView = UITableView()
	private var arrayNews: [Article] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .darkGray
		APIManager.shared.getURL(value: "apple") { news in
			if let articles = news.articles {
				self.arrayNews = articles
			}
			self.tableView.reloadData()
		}
		setTable()
	}
	
	private func setTable() {
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
		])
		tableView.register(TableCell.self, forCellReuseIdentifier: "cell")
		tableView.dataSource = self
		tableView.delegate = self
	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		arrayNews.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
//		cell.textLabel?.text = arrayNews[indexPath.row].title
		cell.titleLabel.text = arrayNews[indexPath.row].title
		cell.descriptionLabel.text = arrayNews[indexPath.row].description
		return cell
	}
	

}


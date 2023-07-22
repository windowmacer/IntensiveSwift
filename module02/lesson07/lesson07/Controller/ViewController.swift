//
//  ViewController.swift
//  lesson07
//
//  Created by Кирилл Арефьев on 16.07.2023.
//

import UIKit

class ViewController: UIViewController {
	var tableView = UITableView()
	var arrayData = [userA, userB, userC]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		addTableView()
	}
	
	private func addTableView() {
		view.addSubview(tableView)
		tableView.delegate = self
		tableView.dataSource = self
		
		tableView.register(DataCell.self, forCellReuseIdentifier: "cell")
		
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		arrayData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataCell
		
		cell.userName.text = arrayData[indexPath.row].name
		cell.userMessege.text = arrayData[indexPath.row].textMessege
		cell.userImage.image = UIImage(named: arrayData[indexPath.row].image)
		return cell
	}
}


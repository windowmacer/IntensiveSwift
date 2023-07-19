//
//  ViewController.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 15.07.2023.
//

import UIKit

class ViewController: UIViewController {
	
	private var tableView = UITableView(frame: .zero, style: .insetGrouped)
	private var arrayData = [dataA, dataB, dataC, dataD, dataE]

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTableView()
		
		title = "myWiki"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "doc.fill.badge.plus"), style: .done, target: self, action: #selector(addCellTablet))
	}

	private func setupTableView() {
		self.view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
	}
	
	@objc private func addCellTablet() {
		let dataNew = DataTable(name: "New Item", image: UIImage(systemName: "doc.text.image"), text: "nil")
		self.arrayData.append(dataNew)
		tableView.reloadData()
	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		arrayData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = arrayData[indexPath.row].name
		cell.imageView?.image = arrayData[indexPath.row].image
		return cell
	}
	// touch
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(systemName: "checkmark.seal.fill")
		let secondViewController = SecondViewController()
		secondViewController.thisTitle = arrayData[indexPath.row].name
		secondViewController.thisText = arrayData[indexPath.row].text
		navigationController?.pushViewController(secondViewController, animated: true)
	}
	// delete
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			self.arrayData.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
}

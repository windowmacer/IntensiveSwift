//
//  ViewController.swift
//  lesson02
//
//  Created by Кирилл Арефьев on 21.11.2023.
//

import UIKit

class ViewController: UIViewController {
	
	private var tableData: [String] = ["1", "2", "3"]
	
	lazy private var tableView: UITableView = {
		let table = UITableView(frame: .zero, style: .insetGrouped)
		
		table.dataSource = self
		table.delegate = self
		table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		table.addSubview(refresh)
		
		table.translatesAutoresizingMaskIntoConstraints = false
		
		return table
	}()
	
	lazy var refresh: UIRefreshControl = {
		let refreshView = UIRefreshControl()

		refreshView.addTarget(self, action: #selector(reloadTable), for: .allEvents)

		return refreshView
	}()

	// MARK: - Load
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Notes"
		navigationController?.navigationBar.prefersLargeTitles = true
		
		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
		])
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addNote))
	}

	// MARK: - custom func
	
	@objc private func addNote() {
		let addNoteVC = AddNoteViewController()
		
		navigationController?.pushViewController(addNoteVC, animated: true)
	}
	
	@objc func reloadTable() {
		refresh.endRefreshing()
	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		tableData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = tableData[indexPath.row]
		return cell
	}
	
	
	
}


//
//  ViewController.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 28.08.2023.
//

import UIKit

class ViewController: UIViewController {
	private let realmManager = RealmManager()
	private var tableView = UITableView(frame: .zero, style: .insetGrouped)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupNavigation()
		setupTableView()
	}
	
	private func setupNavigation() {
		navigationItem.title = "Folder"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addFolder))
	}
	
	@objc private func addFolder() {
		let alert = UIAlertController(title: "New Folder", message: nil, preferredStyle: .alert)
		
		alert.addTextField { titleField in
			titleField.placeholder = "Name Folder"
		}
		
		let okeyButton = UIAlertAction(title: "Save", style: .default) { _ in
			if let nameFolder = alert.textFields?.first?.text {
				let foldet = Folder()
				foldet.name = nameFolder
				self.realmManager.addFolder(folder: foldet)
				self.tableView.reloadData()
			}
		}
		let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
		
		alert.addAction(okeyButton)
		alert.addAction(cancelButton)
		
		present(alert, animated: true)
	}
	
	private func setupTableView() {
		view.addSubview(tableView)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
		])
	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		realmManager.folders.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = realmManager.folders[indexPath.row].name
		cell.imageView?.image = UIImage(systemName: "folder.fill")
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let viewController = NotesViewController()
		viewController.folder = realmManager.folders[indexPath.row]
		navigationController?.pushViewController(viewController, animated: true)
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			realmManager.deleteFolder(folderId: realmManager.folders[indexPath.row].id)
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
	
}

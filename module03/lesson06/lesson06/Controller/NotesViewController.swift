//
//  NotesViewController.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 29.08.2023.
//

import UIKit

class NotesViewController: UIViewController {
	private let realmManager = RealmManager()
	private var tableView = UITableView(frame: .zero, style: .insetGrouped)
	var folder: Folder?

    override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigation()
		setupTableView()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		if let folder = self.folder {
			realmManager.fetchNotes(folderId: folder.id)
			tableView.reloadData()
		}
	}
    
	private func setupNavigation() {
		navigationItem.title = "Notes"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addNote))
	}
	
	@objc private func addNote() {
		let addViewController = AddNoteViewController()
		addViewController.folder = self.folder
		navigationController?.pushViewController(addViewController, animated: true)
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

extension NotesViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		realmManager.notes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = realmManager.notes[indexPath.row].name
		cell.imageView?.image = UIImage(systemName: "doc.text.image")
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let addViewController = AddNoteViewController()
		addViewController.note = realmManager.notes[indexPath.row]
		navigationController?.pushViewController(addViewController, animated: true)
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			realmManager.deleteNote(noteId: realmManager.notes[indexPath.row].id, folderId: folder!.id)
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
	
	
}

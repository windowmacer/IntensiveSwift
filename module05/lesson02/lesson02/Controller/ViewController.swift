//
//  ViewController.swift
//  lesson02
//
//  Created by Кирилл Арефьев on 21.11.2023.
//

import UIKit

class ViewController: UIViewController {
	
	private var noteData = [NoteFB]()
//	private var tableData: [String] = ["1", "2", "3"]
	
	private let serviceFB = ServiceFB()
	
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
		
		loadAddNote()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		loadAddNote()
	}

	// MARK: - custom func
	
	private func loadAddNote() {
		serviceFB.readNotes { notes in
			self.noteData = notes
			self.tableView.reloadData()
		}
	}
	
	@objc private func addNote() {
		let addNoteVC = AddNoteViewController()
		
		navigationController?.pushViewController(addNoteVC, animated: true)
	}
	
	@objc func reloadTable() {
		loadAddNote()
		refresh.endRefreshing()
	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		noteData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = noteData[indexPath.row].title
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let viewController = NoteViewController(note: noteData[indexPath.row])
		
		navigationController?.pushViewController(viewController, animated: true)
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			serviceFB.deleteNote(noteID: noteData[indexPath.row].id)
			noteData.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
	
}


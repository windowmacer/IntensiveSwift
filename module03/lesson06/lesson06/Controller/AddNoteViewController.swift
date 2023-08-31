//
//  AddNoteViewController.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 29.08.2023.
//

import UIKit

class AddNoteViewController: UIViewController {
	private let realManager = RealmManager()
	private let saveButton = UIButton()
	private let nameField = UITextField()
	private let contextField = UITextField()
	var folder: Folder?
	var note: Note?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		setupNameField()
		setupContextField()
		setupSaveButton()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		if note != nil {
			nameField.text = note!.name
			contextField.text = note!.context
		}
	}
	
	private func setupNameField() {
		view.addSubview(nameField)
		nameField.layer.cornerRadius = 15
		nameField.backgroundColor = .systemGray5
		nameField.placeholder = "Name"
		
		nameField.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			nameField.heightAnchor.constraint(equalToConstant: 50),
			nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			nameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
			nameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
		])
	}
	
	private func setupContextField() {
		view.addSubview(contextField)
		contextField.layer.cornerRadius = 15
		contextField.backgroundColor = .systemGray5
		contextField.placeholder = "Context"
		
		contextField.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			contextField.heightAnchor.constraint(equalToConstant: 100),
			contextField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10),
			contextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
			contextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
		])
	}
    
	private func setupSaveButton() {
		view.addSubview(saveButton)
		saveButton.setTitle("Save", for: .normal)
		saveButton.setTitleColor(.white, for: .normal)
		saveButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
		saveButton.backgroundColor = .systemBlue
		saveButton.layer.cornerRadius = 15
		
		saveButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
			saveButton.heightAnchor.constraint(equalToConstant: 50),
			saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
			saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
		])
		saveButton.addTarget(self, action: #selector(touchSaveButton), for: .touchUpInside)
	}
	
	
	@objc private func touchSaveButton() {
		let  newNote = Note()
		if let name = nameField.text, let context = contextField.text {
			newNote.name = name
			newNote.context = context
		}
		if note == nil {
			realManager.addNote(note: newNote, folderId: self.folder!.id)
		} else {
			realManager.updateNote(oldNote: note!, newNote: newNote)
		}
		navigationController?.popViewController(animated: true)
	}

}

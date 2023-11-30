//
//  NoteViewController.swift
//  lesson02
//
//  Created by Кирилл Арефьев on 21.11.2023.
//

import UIKit

class NoteViewController: UIViewController {
	
	private let serviceFB = ServiceFB()
	private var titleNote = String()
	private var textNote = String()
	private var idNote = String()
	
	lazy private var titleField: UITextField = {
		let field = UITextField()
		field.text = titleNote
		
		field.translatesAutoresizingMaskIntoConstraints = false
		field.heightAnchor.constraint(equalToConstant: 60).isActive = true
		
		field.layer.cornerRadius = 30
		field.backgroundColor = .systemGray5
		field.addPadding(20)
		
		return field
	}()
	
	lazy private var textEditor: UITextView = {
		let editor = UITextView()
		editor.text = textNote
		
		editor.translatesAutoresizingMaskIntoConstraints = false
		editor.heightAnchor.constraint(equalToConstant: 240).isActive = true
		
		editor.backgroundColor = .systemGray5
		editor.layer.cornerRadius = 30
		editor.font = .systemFont(ofSize: 16)
		editor.setInsets(top: 20, left: 20, bottom: 20, right: 20)
		
		return editor
	}()
	
	lazy private var editButton: UIButton = {
		let button = UIButton()
		button.setTitle("Edit", for: .normal)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.heightAnchor.constraint(equalToConstant: 60).isActive = true
		
		button.backgroundColor = .systemRed
		button.layer.cornerRadius = 30
		button.setTitleColor(.white, for: .normal)
		button.setTitleColor(.clear, for: .highlighted)
		button.titleLabel?.font = .boldSystemFont(ofSize: 16)
		
		button.addTarget(nil, action: #selector(editNote), for: .touchUpInside)
		
		return button
	}()

	// MARK: - Load
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		
		view.addSubview(titleField)
		view.addSubview(textEditor)
		view.addSubview(editButton)
		NSLayoutConstraint.activate([
			titleField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			
			textEditor.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 30),
			textEditor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			textEditor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			
			editButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
			editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
		])
    }
    
	// MARK: - Init
	
	init(note: NoteFB) {
		super.init(nibName: nil, bundle: nil)
		titleNote = note.title
		textNote = note.text
		idNote = note.id
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - custom func
	
	@objc func editNote() {
		if let newTitle = titleField.text, let newText = textEditor.text {
			let note = NoteFB(id: idNote, title: newTitle, text: newText, date: Date())
			serviceFB.createNote(note: note) { status in
				if status {
					self.navigationController?.popViewController(animated: true)
				}
			}
		}
	
	}
}

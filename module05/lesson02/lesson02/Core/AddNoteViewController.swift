//
//  AddNoteViewController.swift
//  lesson02
//
//  Created by Кирилл Арефьев on 22.11.2023.
//

import UIKit

class AddNoteViewController: UIViewController {
	
	private let serviceFB = ServiceFB()
	
	lazy private var titleField: UITextField = {
		let field = UITextField()
		field.placeholder = "title"
		
		field.translatesAutoresizingMaskIntoConstraints = false
		field.heightAnchor.constraint(equalToConstant: 60).isActive = true
		
		field.layer.cornerRadius = 30
		field.backgroundColor = .systemGray5
		field.addPadding(20)
		
		return field
	}()
	
	lazy private var textEditor: UITextView  = {
		let editor = UITextView()
		
		editor.translatesAutoresizingMaskIntoConstraints = false
		editor.heightAnchor.constraint(equalToConstant: 240).isActive = true
		
		editor.layer.cornerRadius = 30
		editor.backgroundColor = .systemGray5
		editor.font = .systemFont(ofSize: 16)
		editor.setInsets(top: 20, left: 20, bottom: 20, right: 20)
		
		return editor
	}()
	
	lazy private var saveButton: UIButton = {
		let button = UIButton()
		button.setTitle("Save", for: .normal)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.heightAnchor.constraint(equalToConstant: 60).isActive = true
		
		button.backgroundColor = .systemGreen
		button.layer.cornerRadius = 30
		button.setTitleColor(.white, for: .normal)
		button.setTitleColor(.clear, for: .highlighted)
		button.titleLabel?.font = .boldSystemFont(ofSize: 16)
		
		button.addTarget(nil, action: #selector(addNode), for: .touchUpInside)
		
		return button
	}()	
	
	// MARK: - Load

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		title = "New note"
		
		view.addSubview(titleField)
		view.addSubview(textEditor)
		view.addSubview(saveButton)
		NSLayoutConstraint.activate([
			titleField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			
			textEditor.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 30),
			textEditor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			textEditor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			
			saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
			saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
		])
    }
	
	// MARK: - custom func
	
	@objc func addNode() {
		if let title = titleField.text, let text = textEditor.text {
			let note = NoteFB(title: title, text: text, date: Date())
			serviceFB.createNote(note: note) { status in
				if status {
					self.navigationController?.popViewController(animated: true)
				}
			}
		}
	}

}

// MARK: - Extension

extension UITextField {
	func addLeftPadding(_ padding: CGFloat) {
		let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
		self.leftView = paddingView
		self.leftViewMode = .always
	}

	func addRightPadding(_ padding: CGFloat) {
		let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
		self.rightView = paddingView
		self.rightViewMode = .always
	}

	func addPadding(_ padding: CGFloat) {
		addLeftPadding(padding)
		addRightPadding(padding)
	}
}

extension UITextView {
	func setInsets(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
		self.textContainerInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
	}
}

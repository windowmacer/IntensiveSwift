//
//  NewsCollectionCell.swift
//  lesson09
//
//  Created by Кирилл Арефьев on 17.09.2023.
//

import UIKit

class NewsCollectionCell: UICollectionViewCell {
	var imageNews = UIImageView()
	var widthAnchorCell = CGFloat()
	
	var customView = UIView(frame: .zero)
	
	var noteNews = Note()
	var openClosures: (() -> Void)?
	
	private var titleNews = UILabel()
	private var authorNews = UILabel()
	private var dateNews = UILabel()
	private var contextNews = UILabel()
	
	private var mainStack = UIStackView()
	private var titleHStack = UIStackView()
	private var titleVStack = UIStackView()
	
	lazy var button: UIButton = {
		let button = UIButton()
			button.setTitle("Save", for: .normal)
			button.setTitleColor(.white, for: .normal)
			button.backgroundColor = #colorLiteral(red: 0.741604507, green: 0.5587025285, blue: 0.357947588, alpha: 1)
			button.titleLabel?.font = .boldSystemFont(ofSize: 14)
			button.layer.cornerRadius = 20
			return button
		}()
	
	func getNews(title: String?, author: String?, date: String?, context: String?) {
		if let text = title {
			titleNews.text = text
		}
				
		if let text = author {
			authorNews.text = text
		}
				
		if let text = date {
			dateNews.text = text
		}
				
		if let text = context {
			contextNews.text = text
		}
		
//		setupText()
		setupCell()
	}
	
	private func setupText() {
		let textArray = [titleNews, authorNews, dateNews, contextNews]
			
		textArray.forEach { label in
			label.numberOfLines = 0
			label.lineBreakMode = .byWordWrapping
			label.font = .systemFont(ofSize: 12)
			label.textColor = #colorLiteral(red: 0.7215686275, green: 0.7215686275, blue: 0.7216146588, alpha: 1)
			label.textAlignment = .left
		}
			
		titleNews.font = .boldSystemFont(ofSize: 16)
		authorNews.textColor = #colorLiteral(red: 0.4901960492, green: 0.4901960492, blue: 0.4901960492, alpha: 1)
		dateNews.textColor = #colorLiteral(red: 0.4901960492, green: 0.4901960492, blue: 0.4901960492, alpha: 1)
		dateNews.textAlignment = .right
		contextNews.textAlignment = .natural
	}
	
	private func setupHStack() {
		titleHStack.axis = .horizontal
		titleHStack.alignment = .top
		titleHStack.distribution = .equalSpacing
		
		titleHStack.addArrangedSubview(titleNews)
		titleHStack.addArrangedSubview(dateNews)
	}
	
	private func setupVStack() {
		titleVStack.axis = .vertical
		titleVStack.alignment = .fill
//		titleVStack.spacing = 10
		
		titleVStack.addArrangedSubview(titleHStack)
		titleVStack.addArrangedSubview(authorNews)
	}
	
	private func setupMainStack() {
		mainStack.axis = .vertical
		mainStack.alignment = .fill
//		mainStack.spacing = 10
		
		setupHStack()
		setupVStack()
		mainStack.addArrangedSubview(titleVStack)
		mainStack.addArrangedSubview(contextNews)
//		contentView.addSubview(mainStack)
	}
	
	private func setupImageView() {
		contentView.addSubview(imageNews)
		imageNews.layer.cornerRadius = 15
		imageNews.clipsToBounds = true
		imageNews.contentMode = .scaleAspectFill
	}
	
	private func constraintsAllViews() {
		contentView.translatesAutoresizingMaskIntoConstraints = false
//		imageNews.translatesAutoresizingMaskIntoConstraints = false
//		mainStack.translatesAutoresizingMaskIntoConstraints = false
		
//		customView.translatesAutoresizingMaskIntoConstraints = false
		button.translatesAutoresizingMaskIntoConstraints = false
		
//		let widthConstraint = contentView.widthAnchor.constraint(equalToConstant: 120)
//		let minHeightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
//
//		widthConstraint.priority = .defaultHigh
//		minHeightConstraint.priority = .defaultHigh
//
	
//		let widthConstraint = customView.widthAnchor.constraint(equalToConstant: widthAnchorCell)
//		let minHeightConstraint = customView.heightAnchor.constraint(greaterThanOrEqualToConstant: 47)
//
//		widthConstraint.priority = .defaultHigh
//		minHeightConstraint.priority = .defaultHigh
		
		if contentView.constraints.isEmpty {
			NSLayoutConstraint.activate([
				contentView.widthAnchor.constraint(equalToConstant: widthAnchorCell),
				contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
				contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
				contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
				contentView.topAnchor.constraint(equalTo: self.topAnchor),
				contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
			])
		}
		
		if button.constraints.isEmpty {
			NSLayoutConstraint.activate([
				button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
				button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
				button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
				button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
				button.heightAnchor.constraint(equalToConstant: 40)
			])
		}
		
//		NSLayoutConstraint.activate([
			
//			widthConstraint,
//			minHeightConstraint,

//			customView.widthAnchor.constraint(equalToConstant: 120),
//			minHeightConstraint,
//			widthConstraint,
			
//			customView.widthAnchor.constraint(equalToConstant: 220),
//			customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//			customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//			customView.topAnchor.constraint(equalTo: contentView.topAnchor),
//			customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			
//			imageNews.topAnchor.constraint(equalTo: contentView.topAnchor),
//			imageNews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//			imageNews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//			imageNews.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
//			imageNews.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
			
//			mainStack.topAnchor.constraint(equalTo: imageNews.bottomAnchor, constant: 20),
//			mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//			mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
			
//			mainStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
//			mainStack.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
//			mainStack.bottomAnchor.constraint(greaterThanOrEqualTo: button.topAnchor, constant: 20),
			
//			mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			
//			button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//			button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//			button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//			button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
//			button.heightAnchor.constraint(equalToConstant: 40)
//			button.widthAnchor.constraint(equalToConstant: 240)
//		])
	}
	
	private func setupCell() {
//		setupImageView()
//		setupMainStack()
		if button.superview == nil {
			contentView.addSubview(button) // Добавьте кнопку только один раз
		}
		
//		customView.addSubview(button)
//		contentView.addSubview(customView)
		
		customView.backgroundColor = #colorLiteral(red: 0.149019599, green: 0.149019599, blue: 0.149019599, alpha: 1)
		customView.layer.cornerRadius = 15
		
		constraintsAllViews()
		
		contentView.backgroundColor = #colorLiteral(red: 0.149019599, green: 0.149019599, blue: 0.149019599, alpha: 1)
		contentView.layer.cornerRadius = 15
//
	}
	
	func addButton() {
		button.addTarget(self, action: #selector(touchSaveButton), for: .touchUpInside)
	}
	
	func deleteButton() {
		button.setTitle("Delete", for: .normal)
		button.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.3137254902, blue: 0.3137254902, alpha: 1)
		button.addTarget(self, action: #selector(touchDeleteButton), for: .touchUpInside)
	}
	
	
	@objc private func touchSaveButton() {
		let  note = Note()
		
		if let text = titleNews.text {
			note.title = text
		}
		if let text = authorNews.text {
			note.author = text
		}
		if let text = dateNews.text {
			note.dateNews = text
		}
		if let text = contextNews.text {
			note.textNews = text
		}
		if let image = imageNews.image, let imageData = image.pngData() {
			note.imageData = imageData
		}
		
		RealmManager.shared.addNote(note: note)
	}
	
	@objc private func touchDeleteButton() {
		if let deleteFunc = openClosures {
			deleteFunc()
		}
	}
}

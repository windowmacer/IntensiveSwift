
import UIKit

class CollectionCell: UICollectionViewCell {
	
	var imageCell: UIImage?
	private var imageViewTitle = UIImageView()
	
	private var textTitle = UILabel()
	private var textAuthor = UILabel()
	private var textData = UILabel()
	private var textContext = UILabel()
	
	private var button = UIButton()
	
	private var mainStack = UIStackView()
	private var textSignHStack = UIStackView()
	private var textSignVStack = UIStackView()
	
	func setupCollectionCell(title: String?, author: String?, data: String?, context: String?) {
		
		if let text = title {
			textTitle.text = text
		}
		
		if let text = author {
			textAuthor.text = text
		}
		
		if let text = data {
			textData.text = text
		}
		
		if let text = context {
			textContext.text = text
		}
		setupText()
		setupMainStack()
		setupSignHStack()
		setupSignVStack()
		addMainStack()
		
	}
	
	private func setupText() {
		let textArray = [textTitle, textAuthor, textData, textContext]
		
		textArray.forEach { label in
			label.numberOfLines = 0
			label.lineBreakMode = .byWordWrapping
			label.font = .systemFont(ofSize: 12)
			label.textColor = .black
		}
		
		textTitle.font = .boldSystemFont(ofSize: 16)
		textAuthor.textColor = .systemGray
		textData.textColor = .systemGray
	}
	
	private func setupMainStack() {
		contentView.addSubview(mainStack)
		
		mainStack.axis = .vertical
		mainStack.alignment = .fill
		mainStack.distribution = .fillEqually
		mainStack.spacing = 10
		
		mainStack.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
			mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
			mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
		])
	}
	
	private func setupSignVStack() {
		textSignVStack.axis = .vertical
		textSignVStack.alignment = .leading
		textSignVStack.distribution = .equalSpacing
		
		textSignVStack.addArrangedSubview(textSignHStack)
		textSignVStack.addArrangedSubview(textAuthor)
	}
	
	private func setupSignHStack() {
		textSignHStack.axis = .horizontal
		textSignHStack.alignment = .top
		textSignHStack.distribution = .equalSpacing
		
		textSignHStack.addArrangedSubview(textTitle)
		textSignHStack.addArrangedSubview(textData)
	}
	
	private func addMainStack() {
		mainStack.addArrangedSubview(textSignVStack)
		mainStack.addArrangedSubview(textContext)
	}
}


import UIKit

class CollectionCell: UICollectionViewCell {
	
	var imageViewTitle = UIImageView()
	var contentHeight = CGFloat()
	var contentWidth = CGFloat()
	
	private var textTitle = UILabel()
	private var textAuthor = UILabel()
	private var textData = UILabel()
	private var textContext = UILabel()
	
	lazy var button: UIButton = {
		let button = UIButton()
		button.setTitle("Читать новость", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = #colorLiteral(red: 0.9853208661, green: 0.5047547221, blue: 0.356146872, alpha: 1)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.layer.cornerRadius = 20
		return button
	}()
	
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
		setupImageView()
		setupMainStack()
		addMainStack()
	}
	
	private func setupText() {
		let textArray = [textTitle, textAuthor, textData, textContext]
		
		textArray.forEach { label in
			label.numberOfLines = 0
			label.lineBreakMode = .byWordWrapping
			label.font = .systemFont(ofSize: 12)
			label.textColor = .black
			label.textAlignment = .left
		}
		
		textTitle.font = .boldSystemFont(ofSize: 16)
		textAuthor.textColor = .systemGray
		textData.textColor = .systemGray
		textData.textAlignment = .right
		textContext.textAlignment = .natural
	}
	
	private func setupImageView() {
		contentView.addSubview(imageViewTitle)
		imageViewTitle.layer.cornerRadius = 15
		imageViewTitle.clipsToBounds = true
		imageViewTitle.contentMode = .scaleAspectFill
		imageViewTitle.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			imageViewTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageViewTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			imageViewTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			imageViewTitle.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
			imageViewTitle.heightAnchor.constraint(lessThanOrEqualToConstant: 150)
		])
	}
	
	private func setupMainStack() {
		contentView.addSubview(mainStack)
		
		mainStack.axis = .vertical
		mainStack.alignment = .fill
		mainStack.distribution = .fill
		mainStack.spacing = 10

		mainStack.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			contentView.widthAnchor.constraint(equalToConstant: contentWidth),
			contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: contentHeight),
			contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			contentView.topAnchor.constraint(equalTo: self.topAnchor),
			contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			
			mainStack.topAnchor.constraint(equalTo: imageViewTitle.bottomAnchor, constant: 20),
			mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
		])
		
		setupSignHStack()
		setupSignVStack()
	}
	
	private func setupSignVStack() {
		textSignVStack.axis = .vertical
		textSignVStack.alignment = .fill
		textSignVStack.distribution = .equalCentering
		textSignVStack.spacing = 10
		
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
		contentView.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			button.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 20),
			button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
			button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
			button.heightAnchor.constraint(equalToConstant: 40)
		])
	}
}

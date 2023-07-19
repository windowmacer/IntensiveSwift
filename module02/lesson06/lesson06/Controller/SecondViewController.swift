//
//  SecondViewController.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 16.07.2023.
//

import UIKit

class SecondViewController: UIViewController {
	var thisTitle = String()
	var thisText = String()
	
	lazy var thisLabel: UILabel = {
		var label = UILabel()
		label.frame = .init(x: 0, y: 0, width: 300, height: 300)
		label.text = thisText
		label.numberOfLines = 0
		label.textColor = .black
		label.font = .systemFont(ofSize: 16)
		label.center = view.center
		return label
	}()
   
	override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		title = thisTitle
		view.addSubview(thisLabel)
       
    }

}

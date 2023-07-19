//
//  ViewController.swift
//  Stoplight
//
//  Created by Кирилл Арефьев on 11.06.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var redView: UIView!
	@IBOutlet weak var orangeView: UIView!
	@IBOutlet weak var greenView: UIView!
	@IBOutlet weak var switchButton: UIButton!
	
	func preparingLaunch(_ thisView: UIView, _ colorView: UIColor) {
		thisView.layer.cornerRadius = 75
		thisView.layer.borderWidth = 2
		thisView.layer.borderColor = UIColor.black.cgColor
		thisView.backgroundColor = colorView
	}
	
	override func viewDidLoad() {
		var collectionView: [UIView] = [redView, orangeView, greenView]
		for view in collectionView {
			preparingLaunch(view, .clear)
		}
	}
	
	@IBAction func switchAction(_ sender: UIButton) {
		if redView.backgroundColor == .clear && orangeView.backgroundColor == .clear && greenView.backgroundColor == .clear {
			preparingLaunch(redView, .red)
		} else if redView.backgroundColor != .clear && orangeView.backgroundColor == .clear && greenView.backgroundColor == .clear {
			preparingLaunch(redView, .clear)
			preparingLaunch(orangeView, .orange)
		} else if redView.backgroundColor == .clear && orangeView.backgroundColor != .clear && greenView.backgroundColor == .clear {
			preparingLaunch(orangeView, .clear)
			preparingLaunch(greenView, .green)
		} else if redView.backgroundColor == .clear && orangeView.backgroundColor == .clear && greenView.backgroundColor != .clear {
			preparingLaunch(greenView, .clear)
		}
	}
	
	
	


}


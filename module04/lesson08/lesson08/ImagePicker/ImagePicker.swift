//
//  ImagePicker.swift
//  lesson08
//
//  Created by Кирилл Арефьев on 06.11.2023.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
	
	@Binding var images: [UIImage?]
	
	func makeUIViewController(context: Context) -> some UIViewController {
		
		let picker = UIImagePickerController()
		picker.sourceType = .photoLibrary
		picker.allowsEditing = true
		
		picker.delegate = context.coordinator
		
		return picker
	}

	func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
	
	func makeCoordinator() -> PickerCoordinator {
		PickerCoordinator(object: self)
	}
	
	final class PickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		
		var object: ImagePicker
		
		init(object: ImagePicker) {
			self.object = object
		}
		
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			
			if let image = info[.editedImage] as? UIImage {
				object.images.append(image)
			}
			
			picker.dismiss(animated: true)
		}
	}
}

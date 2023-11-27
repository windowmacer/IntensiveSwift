//
//  Service.swift
//  lesson02
//
//  Created by Кирилл Арефьев on 27.11.2023.
//

import Foundation
import Firebase

class ServiceFB {
	
	// MARK: - create
	
	func createNote(note: NoteFB, completion: @escaping (Bool) -> ()) {
		
		let item: [String : Any] = [
			"title"	:	note.title,
			"note"	:	note.text,
			"date"	:	note.date
		]
		
		Firestore.firestore()
			.collection("notes")
			.document(note.id)
			.setData(item) { error in
				if let value = error {
					completion(false)
					print(value.localizedDescription)
				} else {
					completion(true)
				}
			}
	}
	
	// MARK: - read
	
	func readNotes(completion: @escaping ([NoteFB]) -> ()) {
		Firestore.firestore()
			.collection("notes")
			.order(by: "date", descending: true)
			.getDocuments { snapshot, error in
				guard error == nil else { return }
				guard let docks = snapshot?.documents else { return }
				var allNotes = [NoteFB]()
				
				docks.forEach { dock in
					var date: Date {
						if let timeStamp = dock["date"] as? Timestamp {
							return timeStamp.dateValue()
						}
						return Date()
					}
					
					let note = NoteFB(id: dock.documentID,
									  title: dock["title"] as? String ?? "",
									  text: dock["note"] as? String ?? "",
									  date: date)
					allNotes.append(note)
				}
				
				completion(allNotes)
			}
	}
	
	// MARK: - delete
	
	func deleteNote(noteID: String) {
		Firestore.firestore()
			.collection("notes")
			.document(noteID)
			.delete()
	}
}

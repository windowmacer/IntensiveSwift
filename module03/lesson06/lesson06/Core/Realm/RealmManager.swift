//
//  RealmManager.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 30.08.2023.
//

import Foundation
import RealmSwift

class RealmManager {
	let realm = try! Realm()
	var folders = [Folder]()
	var notes = [Note]()
	
	init() {
		fetchFolders()
//		fetchNotes()
	}
	
	// MARK: - Folder
	
	// fetch Folder
	private func fetchFolders() {
		let folders = realm.objects(Folder.self)
		self.folders = Array(folders)
	}
	
	// add Folder
	func addFolder(folder: Folder) {
		try! realm.write({
			realm.add(folder)
		})
		fetchFolders()
	}
	
	// delete Folder
	func deleteFolder(folderId: ObjectId) {
		if let folder = realm.object(ofType: Folder.self, forPrimaryKey: folderId) {
			try! realm.write({
				for note in folder.notes {
					realm.delete(note)
				}
				realm.delete(folder)
			})
		}
		fetchFolders()
	}
	
	// MARK: - Note
	
	// fetch Note
	func fetchNotes(folderId: ObjectId) {
		if let folder = realm.object(ofType: Folder.self, forPrimaryKey: folderId) {
			self.notes = Array(folder.notes.sorted(by: <))
		}
	}
	
	// add Note
	func addNote(note: Note, folderId: ObjectId) {
		if let folder = realm.object(ofType: Folder.self, forPrimaryKey: folderId) {
			try! realm.write({
				folder.notes.append(note)
			})
		}
	}
	
	// update Note
	func updateNote(oldNote: Note, newNote: Note) {
		try! realm.write({
			oldNote.name = newNote.name
			oldNote.context = newNote.context
		})
	}
	
	// delete Note
	func deleteNote(noteId: ObjectId, folderId: ObjectId) {
		if let note = realm.object(ofType: Note.self, forPrimaryKey: noteId) {
			try! realm.write({
				realm.delete(note)
			})
		}
		fetchNotes(folderId: folderId)
	}
}

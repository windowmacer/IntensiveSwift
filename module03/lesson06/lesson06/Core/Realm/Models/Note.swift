//
//  Note.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 30.08.2023.
//

import Foundation
import RealmSwift

class Note: Object, Comparable {
	static func < (lhs: Note, rhs: Note) -> Bool {
		return lhs.name < rhs.name
	}
	
	@Persisted(primaryKey: true) var id: ObjectId
	@Persisted var name = ""
	@Persisted var context = ""
	@Persisted(originProperty: "notes") var folder: LinkingObjects<Folder>
	
}

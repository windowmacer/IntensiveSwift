//
//  Folder.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 30.08.2023.
//

import Foundation
import RealmSwift

class Folder: Object {
	@Persisted(primaryKey: true) var id: ObjectId
	@Persisted var name = ""
	@Persisted var notes: List<Note>
}

//
//  ModelRealm.swift
//  lesson05
//
//  Created by Кирилл Арефьев on 28.08.2023.
//

import Foundation
import RealmSwift

class Card: Object {
	@Persisted (primaryKey: true) var id: ObjectId
//	@Persisted (primaryKey: true) var number = 0
	@Persisted var name = ""
	@Persisted var type = ""
	
}

//
//  RealmManager.swift
//  lesson05
//
//  Created by Кирилл Арефьев on 28.08.2023.
//

import Foundation
import RealmSwift

class RealmManager {
	let realm = try! Realm()
	var allCards: [Card]?
	
	init() {
		fetchCards()
	}
	
//	featch
	private func fetchCards() {
		let cards = realm.objects(Card.self)
		allCards = Array(cards)
	}
	
//	create
	func createCard(newCard: Card) {
		try! realm.write {
			realm.add(newCard)
		}
		fetchCards()
	}
	
//	delete
	func deleteCard(id: ObjectId) {
		if let card = realm.object(ofType: Card.self, forPrimaryKey: id) {
			try! realm.write({
				realm.delete(card)
			})
		}
		fetchCards()

	}
	
	
}

//
//  ContentViewModel.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 08.10.2023.
//

import Foundation

class ContentViewModel: ObservableObject {
	@Published var news = [Article]()
	var textSearch = "apple"
	
	func getNews() {
		ManagerAPI.shared.getURL(value: textSearch) { item in
			if let news = item.articles {
				self.news = news
			}
		}
	}
	
	init() {
		getNews()
	}
}

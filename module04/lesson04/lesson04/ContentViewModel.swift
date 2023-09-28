//
//  ContentViewModel.swift
//  lesson04
//
//  Created by Кирилл Арефьев on 28.09.2023.
//

import Foundation

class ContentViewModel: ObservableObject {
	@Published var news = [Article]()
	
	func getNews() {
		ManagerAPI.shared.getURL(value: "apple") { item in
			if let news = item.articles {
				self.news = news
			}
		}
	}
	
	init() {
		getNews()
	}
}

//
//  APIManager.swift
//  lesson02
//
//  Created by Кирилл Арефьев on 07.08.2023.
//

import Foundation

//"https://newsapi.org/v2/everything?q=tesla&from=2023-07-07&sortBy=publishedAt&apiKey=1d6f184378c849e08a94c28a6135dba6"

class APIManager {
	
	static let shared = APIManager()
	
	private let apiKey: String = "1d6f184378c849e08a94c28a6135dba6"

	func getURL(value: String, competion: @escaping (News) -> Void) {
		
	// MARK: 1 - configuration URL Components
		
		var urlComponent = URLComponents()
		urlComponent.scheme = "https"
		urlComponent.host = "newsapi.org"
		urlComponent.path = "/v2/everything"
	
		urlComponent.queryItems = [
			URLQueryItem(name: "q", value: value),
			URLQueryItem(name: "pageSize", value: "10"),
			URLQueryItem(name: "language", value: "ru"),
			URLQueryItem(name: "apiKey", value: apiKey)
		]
		
	// MARK: 2 - creating a request
		
		if let url = urlComponent.url {
			let request = URLRequest(url: url)
			
	// MARK: 3 - complete the request
			
			let task = URLSession.shared.dataTask(with: request) { data, response, error in
				guard error == nil else {
					print(error!.localizedDescription)
					return
				}
	// MARK: 4 - parser JSON
				if let data = data, let news = try? JSONDecoder().decode(News.self, from: data) {
			
	// MARK: 5 - сlosures start
					DispatchQueue.main.async {
						competion(news)
					}
				}

			}
			task.resume()
		}
	}
}

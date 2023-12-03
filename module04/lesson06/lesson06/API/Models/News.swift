//
//  News.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 08.10.2023.
//

import Foundation

// MARK: - News
struct News: Codable, Hashable {
	let status: String?
	let totalResults: Int?
	let articles: [Article]?
}

// MARK: - Article
struct Article: Codable, Hashable {
	let source: Source?
	let author: String?
	let title, description: String?
	let url: String?
	let urlToImage: String?
	let publishedAt: String?
	let content: String?
}

// MARK: - Source
struct Source: Codable, Hashable {
	let id: String?
	let name: String?
}
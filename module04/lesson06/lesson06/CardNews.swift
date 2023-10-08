//
//  CardNews.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 08.10.2023.
//

import SwiftUI

struct CardNews<Content: View>: View {
	var news: Article
	var content: Content
	
	init(news: Article, @ViewBuilder content: () -> Content) {
		self.news = news
		self.content = content()
	}
	
	var body: some View {
		VStack(spacing: 10) {
			content

			HStack(alignment: .top) {
				VStack(alignment: .leading) {
					Text(news.title ?? "")
						.font(.system(size: 20, weight: .bold))
						.foregroundColor(.black)
					Text(news.author ?? "")
						.font(.system(size: 16))
						.foregroundColor(.gray)
				}
				Spacer()
				Text(news.publishedAt ?? "")
					.font(.system(size: 14))
					.foregroundColor(.gray)
			}
			Text(news.description ?? "")
				.font(.system(size: 14))
				.foregroundColor(.black)
		}
		.cardStyle()
	}
}

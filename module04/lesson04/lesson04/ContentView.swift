//
//  ContentView.swift
//  lesson04
//
//  Created by Кирилл Арефьев on 27.09.2023.
//

import SwiftUI

struct ContentView: View {
	@StateObject var contentViewModel = ContentViewModel()
	
    var body: some View {
		NavigationView {
			ScrollView(.vertical, showsIndicators: false) {
				LazyVStack{
					ForEach(contentViewModel.news, id: \.self) { item in
						CardNews(news: item)
					}
				}
				.padding(15)
			}
		}
    }
}

struct CardNews: View {
	var news: Article
	var body: some View {
		VStack(spacing: 10) {
			AsyncImage(url: URL(string: news.urlToImage ?? "")) {
				image in
				image
					.resizable()
					.scaledToFit()
					.cornerRadius(10)
			} placeholder: {
				ProgressView()
					.padding()
			}

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
		.padding(.horizontal, 10)
		.padding(.vertical, 10)
		.background(.gray.opacity(0.35))
		.cornerRadius(15)
		.padding(.bottom, 15)
	}
}

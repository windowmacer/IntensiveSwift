//
//  ContentView.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 08.10.2023.
//

import SwiftUI

struct ContentView: View {
	@StateObject var contentViewModel = ContentViewModel()
	@State var textSearch = String()
	
	var body: some View {
		NavigationView {
			ScrollView(.vertical, showsIndicators: false) {
				VStack {
					TextField("Search", text: $textSearch)
						.cardStyle()
						.onSubmit {
							contentViewModel.textSearch = textSearch
							contentViewModel.getNews()
						}
					LazyVStack {
						ForEach(contentViewModel.news, id: \.self) { item in
							CardNews(news: item) {
								if let urlNews = item.urlToImage {
									AsyncImage(url: URL(string: urlNews)) { image in
										image
											.resizable()
											.scaledToFit()
											.cornerRadius(10)
									} placeholder: {
										ProgressView()
											.padding()
									}
								}
							}
						}
					}
				}
				.padding(20)
			}
		}
	}
}

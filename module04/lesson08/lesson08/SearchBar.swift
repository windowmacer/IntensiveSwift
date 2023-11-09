//
//  SearchBar.swift
//  lesson08
//
//  Created by Кирилл Арефьев on 24.10.2023.
//

import SwiftUI

struct SearchBar: View {
	@Binding var stringURL: String
	var body: some View  {
		HStack {
			TextField("URL", text: $stringURL)
				.padding()
				.background(.gray.opacity(0.25))
				.cornerRadius(10)
			NavigationLink {
				WebContent(stringURL: stringURL)
			} label: {
				Image(systemName: "chevron.right.circle.fill")
					.resizable()
					.frame(width: 30, height: 30)
					.foregroundColor(.blue)
			}

		}
	}
}

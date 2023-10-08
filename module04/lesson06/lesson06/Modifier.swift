//
//  Modifier.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 08.10.2023.
//

import SwiftUI

struct CardStyle: ViewModifier {
	func body(content: Content) -> some View {
		content
			.padding(.horizontal, 10)
			.padding(.vertical, 10)
			.background(.gray.opacity(0.35))
			.cornerRadius(15)
			.padding(.bottom, 15)
	}
}

extension View {
	func cardStyle() -> some View {
		modifier(CardStyle())
	}
}

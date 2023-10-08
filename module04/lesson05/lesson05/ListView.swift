//
//  ListView.swift
//  lesson05
//
//  Created by Кирилл Арефьев on 07.10.2023.
//

import SwiftUI

struct ListView: View {
	var body: some View {
		VStack {
			Image(systemName: "gear")
				.resizable()
				.scaledToFit()
				.padding(.horizontal, 120)
				.padding(.bottom, 20)
			Text("We didn't, but we are working on this project!")
				.font(.system(size: 16))
		}
		.padding(.horizontal, 20)
	}
}

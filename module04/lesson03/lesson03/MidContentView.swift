//
//  MidContentView.swift
//  lesson03
//
//  Created by Кирилл Арефьев on 25.09.2023.
//

import SwiftUI

struct MidContentView: View {
	@Binding var textMidView: String
	@EnvironmentObject var viewModel: ViewModel
	
	var body: some View {
		
			VStack(alignment: .center, spacing: 20) {
				Spacer()
				
				HStack(alignment: .center, spacing: 10) {
					Text("All:")
						.foregroundColor(.white)
					Text(viewModel.textObservableObject)
						.foregroundColor(.white)
					Spacer()
				}
				.frame(maxWidth: .infinity)
				.padding()
				.background(.green)
				.cornerRadius(10)
				
				Text("Send text to ContentView:")
				
				TextField("Text", text: $textMidView)
					.frame(maxWidth: .infinity)
					.padding()
					.background(.gray)
					.foregroundColor(.black)
					.cornerRadius(10)
				
				NavigationLink {
					JunContentView()
				} label: {
					Text("Next")
						.frame(maxWidth: .infinity)
						.padding()
						.background(.blue)
						.foregroundColor(.white)
						.cornerRadius(10)
				}
				Spacer()
			}
			.padding(.horizontal, 20)
		
    }
}

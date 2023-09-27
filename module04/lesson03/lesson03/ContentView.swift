//
//  ContentView.swift
//  lesson03
//
//  Created by Кирилл Арефьев on 25.09.2023.
//

import SwiftUI

struct ContentView: View {
	@State var text = ""
	@EnvironmentObject var viewModel: ViewModel
	
    var body: some View {
		NavigationView {
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
				
				HStack(alignment: .center, spacing: 10) {
					Text("Reply from MidView:")
						.foregroundColor(.white)
					Text(text)
						.foregroundColor(.white)
					Spacer()
				}
				.frame(maxWidth: .infinity)
				.padding()
				.background(.yellow)
				.cornerRadius(10)
				
				NavigationLink {
					MidContentView(textMidView: $text)
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
}

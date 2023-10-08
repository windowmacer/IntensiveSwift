//
//  HomeView.swift
//  lesson05
//
//  Created by Кирилл Арефьев on 07.10.2023.
//

import SwiftUI

struct HomeView: View {
	@Binding var selection: Int
	var body: some View {
		ZStack(alignment: .bottom) {
			Image("ImageHome")
				.resizable()
				.edgesIgnoringSafeArea(.vertical)

			VStack(spacing: 20) {
				Text("Welcome!")
					.bold()
					.font(.system(size: 30))
				Text("Here you can explore exciting possibilities. Our application is designed to help you experiment with the functions of SwiftUI.")
					.font(.system(size: 16))
					.multilineTextAlignment(.center)
				Button {
					selection = 3
				} label: {
					Text("Next")
						.font(.system(size: 16))
						.bold()
						.padding(.vertical, 15)
						.padding(.horizontal, 100)
						.foregroundColor(.white)
						.background(.blue)
						.cornerRadius(20)
				}
			}
			.frame(maxWidth: .infinity)
			.padding(.top, 50)
			.padding(.bottom, 150)
			.padding(.horizontal, 20)
			.background(.white)
			.cornerRadius(20)
		}
		.edgesIgnoringSafeArea(.bottom)
		
	}
}

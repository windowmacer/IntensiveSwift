//
//  JunContentView.swift
//  lesson03
//
//  Created by Кирилл Арефьев on 25.09.2023.
//

import SwiftUI

struct JunContentView: View {
	@EnvironmentObject var viewModel: ViewModel
	
    var body: some View {
			VStack(alignment: .center, spacing: 20) {
				Spacer()
				Text("Send a text message to everyone:")
				TextField("Text", text: $viewModel.textObservableObject)
					.frame(maxWidth: .infinity)
					.padding()
					.background(.gray)
					.foregroundColor(.black)
					.cornerRadius(10)
				Button {
					viewModel.isLogin = false
				} label: {
					Text("Log out")
						.frame(maxWidth: .infinity)
						.padding()
						.background(.red)
						.foregroundColor(.white)
						.cornerRadius(10)
				}

				Spacer()
			}
			.padding(.horizontal, 20)
    }
}


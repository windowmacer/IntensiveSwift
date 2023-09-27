//
//  LoginView.swift
//  lesson03
//
//  Created by Кирилл Арефьев on 25.09.2023.
//

import SwiftUI

struct LoginView: View {
	@EnvironmentObject var viewModel: ViewModel
	
    var body: some View {
		VStack(alignment: .center, spacing: 20) {
			Spacer()
			Text("Hello!")
			
			Button {
				viewModel.isLogin = true
			} label: {
				Text("Log in")
					.frame(maxWidth: .infinity)
					.padding()
					.background(.green)
					.foregroundColor(.white)
					.cornerRadius(10)
			}
			Spacer()
		}
		.padding(.horizontal, 20)
    }
}

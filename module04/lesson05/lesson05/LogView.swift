//
//  LogView.swift
//  lesson05
//
//  Created by Кирилл Арефьев on 07.10.2023.
//

import SwiftUI

struct LogView: View {
	@Binding var log: Bool
	@State var login = String()
	@State var password = String()
	
	var body: some View {
		VStack(alignment: .leading, spacing: 20) {
			HStack() {
				Spacer()
				Image(systemName: "door.left.hand.open")
					.resizable()
					.scaledToFit()
				Spacer()
			}
				.padding(.horizontal, 120)
				.padding(.bottom, 20)
			
			HStack(alignment: .center) {
				Text("Login:")
					.padding(.horizontal, 10)
				Spacer()
				TextField("My login", text: $login)
				Spacer()
			}
				.frame(maxWidth: .infinity)
				.padding(.vertical, 20)
				.padding(.leading, 20)
				.background(.gray.opacity(0.5))
				.cornerRadius(20)
			
			HStack(alignment: .center) {
				Text("Password:")
					.padding(.horizontal, 10)
				Spacer()
				SecureField("My password", text: $password)
				Spacer()
			}
				.frame(maxWidth: .infinity)
				.padding(.vertical, 20)
				.padding(.leading, 20)
				.background(.gray.opacity(0.5))
				.cornerRadius(20)
			
			Button {
				if login == "admin" && password == "1234" {
					log = true
				}
			} label: {
				Text("Log In")
					.frame(maxWidth: .infinity)
					.padding(.vertical, 20)
					.padding(.leading, 20)
					.font(.system(size: 16))
					.bold()
					.foregroundColor(.white)
					.background(.green)
					.cornerRadius(20)
			}

		}
		.padding(.horizontal, 20)
		.navigationDestination(isPresented: $log) {
			Text("Hello!")
		}
	}
}

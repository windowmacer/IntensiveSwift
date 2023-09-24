//
//  ContentView.swift
//  lesson02
//
//  Created by Кирилл Арефьев on 22.09.2023.
//

import SwiftUI

struct ContentView: View {
	@State var login = ""
	@State var password = ""
	@State var isEditinngEmail = false
	@State var isEditinngPassword = false
	
	var body: some View {
		VStack(spacing: 24) {
			Spacer()
			HStack(spacing: 15) {
				Image("AvatarImage")
					.resizable()
					.frame(width: 120, height: 120)
					.cornerRadius(40)
				
				VStack(alignment: .leading, spacing: 6) {
					TextUser(name: login)
					TextUser(name: password)
				}
				Spacer()
			}
			.frame(maxWidth: .infinity)
			.padding(.horizontal, 27)
			
			VStack(spacing: 22) {
				TextField("email@mail.com", text: $login)
					.padding(.vertical, 16)
					.padding(.leading, 27)
					.background(Color("TextFieldColor"))
					.font(.system(size: 16))
					.foregroundColor(isEditinngEmail ? .black : Color("TextColor"))
					.cornerRadius(10)
					.onTapGesture {
						isEditinngEmail = true
					}
			
				SecureField("password", text: $password)
					.padding(.vertical, 16)
					.padding(.leading, 27)
					.background(Color("TextFieldColor"))
					.font(.system(size: 16))
					.foregroundColor(isEditinngPassword ? .black : Color("TextColor"))
					.cornerRadius(10)
					.onTapGesture {
						isEditinngPassword = true
					}
			
				Button {
					// action
				} label: {
					Text("Log In")
						.frame(maxWidth: .infinity)
						.padding(.vertical, 16)
						.background(Color("ButtonColor"))
						.font(.system(size: 16))
						.foregroundColor(.white)
						.cornerRadius(10)
				}
				
			}
			.frame(maxWidth: .infinity)
			.padding(.horizontal, 27)
			.padding(.vertical, 39)
			.background(.white)
			.cornerRadius(20)
			
			Button("Registration") {
				// action
			}
			.foregroundColor(.white)
			.font(.system(size: 16))
			
			Spacer()
			
		}
		.padding(.horizontal, 17)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("MainColor"))
	}
}

struct TextUser: View {
	var name: String
	var body: some View {
		Text(name)
			.foregroundColor(.white)
			.font(.system(size: 16))
			.bold()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

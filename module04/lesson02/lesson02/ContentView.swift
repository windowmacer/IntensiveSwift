//
//  ContentView.swift
//  lesson02
//
//  Created by Кирилл Арефьев on 22.09.2023.
//

import SwiftUI

struct ContentView: View {
	@State var login = String()
	@State var password = String()
	
    var body: some View {
        VStack {
			HStack {
				Image(systemName: "person.crop.circle")
					.resizable()
					.frame(width: 100, height: 100)
				VStack {
					Text("email@mail")
					Text("password")
				}
			}
			.background(.red)
			.cornerRadius(10)
			
			VStack {
				TextField("Login", text: $login)
					.padding()
					.background(.gray)
					.cornerRadius(10)
				TextField("Password", text: $password)
					.padding()
					.background(.gray)
					.cornerRadius(10)
			}
			.background(.white)
			
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
			Text("Lol!")
				.padding(10)
        }
        .padding()
		.background(.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

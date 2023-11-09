//
//  ContentView.swift
//  lesson07
//
//  Created by Кирилл Арефьев on 21.10.2023.
//

import SwiftUI

struct ContentView: View {
	@State private var firstName = ""
	@State private var lastName = ""
	@State private var userGender = 0
	@State private var birthdate = Date()
	
	private var genderOptions = ["🙍‍♂️ Male", "🙍‍♀️ Female", "🤖 Other"]
	
    var body: some View {
		NavigationView {
			Form {
				Section("Personal information") {
					TextField("First Name", text: $firstName)
					TextField("Last Name", text: $lastName)
					Picker("Gender", selection: $userGender) {
						ForEach(Array(genderOptions.enumerated()), id: \.offset) { index, option in
							Text(option)
								.tag(index)
						}
					}
					.pickerStyle(SegmentedPickerStyle())
					DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
				}
			}
			.navigationTitle("Account")
		}
    }
}

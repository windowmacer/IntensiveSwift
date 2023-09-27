//
//  lesson03App.swift
//  lesson03
//
//  Created by Кирилл Арефьев on 25.09.2023.
//

import SwiftUI

@main

struct lesson03App: App {
	@StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
			if  viewModel.isLogin {
				ContentView()
					.environmentObject(viewModel)
			} else {
				LoginView()
					.environmentObject(viewModel)
			}
        }
    }
}

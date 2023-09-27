//
//  ViewModel.swift
//  lesson03
//
//  Created by Кирилл Арефьев on 25.09.2023.
//

import Foundation

class ViewModel: ObservableObject {
	@Published var textObservableObject = ""
	@Published var isLogin = true
}

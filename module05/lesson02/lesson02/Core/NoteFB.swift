//
//  NoteFB.swift
//  lesson02
//
//  Created by Кирилл Арефьев on 27.11.2023.
//

import Foundation

struct NoteFB: Identifiable {
	var id = UUID().uuidString
	var title: String
	var text: String
	var date: Date
}

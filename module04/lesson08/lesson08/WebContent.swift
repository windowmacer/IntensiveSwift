//
//  WebContent.swift
//  lesson08
//
//  Created by Кирилл Арефьев on 24.10.2023.
//

import SwiftUI

struct WebContent: View {
	@State var isLoaded = false
	var stringURL: String
	
	var body: some View {
		ZStack {
			WebView(loaded: $isLoaded, stringURL: stringURL)
			if !isLoaded {
				ProgressView()
			}
		}
	}
}

//
//  WebView.swift
//  lesson08
//
//  Created by Кирилл Арефьев on 24.10.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
	@Binding var loaded: Bool
	var stringURL: String
	
	func makeUIView(context: Context) -> some UIView {
		let webView = WKWebView()
		
		if let myURL = URL(string: stringURL) {
			let myRequest = URLRequest(url: myURL)
			webView.load(myRequest)
		}
		
		webView.navigationDelegate = context.coordinator
		
		return webView
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {}
	
	func makeCoordinator() -> MyWebCoordinator {
		MyWebCoordinator { status in
			self.loaded = status
		}
	}

	final class MyWebCoordinator: NSObject, WKNavigationDelegate {
		var loaded: (Bool) -> ()
		
		init(loaded: @escaping (Bool) -> Void) {
			self.loaded = loaded
		}
		
		func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
			loaded(true)
		}
	}
}

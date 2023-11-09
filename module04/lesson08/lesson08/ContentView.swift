//
//  ContentView.swift
//  lesson08
//
//  Created by Кирилл Арефьев on 24.10.2023.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isShowCollection = false
	@State private var isShowPicker = false
	@State private var stringURL = ""
	@State var imagesCollection = [UIImage(named: "space")]
   
	var body: some View {
		NavigationView {
			VStack {
				SearchBar(stringURL: $stringURL)
					.padding()
				Button("Show Collection") {
					isShowCollection.toggle()
				}
				.sheet(isPresented: $isShowCollection) {
					VStack {
						Spacer()
						CollectionViewController(imagesCollectionView: $imagesCollection)
							.frame(maxHeight: 210)
						Button("Show picker") {
							isShowPicker.toggle()
						}
						.padding(10)
						.sheet(isPresented: $isShowPicker) {
							ImagePicker(images: $imagesCollection)
						}
						Spacer()
					}
				}
			}
		}
    }
}

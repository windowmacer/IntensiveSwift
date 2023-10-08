//
//  ContentView.swift
//  lesson05
//
//  Created by Кирилл Арефьев on 03.10.2023.
//

import SwiftUI

struct ContentView: View {
	@State var selection = 1
	@State var isLog = false
	
	init() {
		UITabBar.appearance().isHidden = true
	}
	
    var body: some View {
		ZStack(alignment: .bottom) {
			TabView(selection: $selection) {
				HomeView(selection: $selection)
					.tag(1)
				ListView()
					.tag(2)
				LogView(log: $isLog)
					.tag(3)
			}
			HStack {
				ForEach(1...3, id: \.self) { item in
					Spacer()
					ButtonTabView(selection: $selection, numberList: item)
					Spacer()
				}
			}
			.frame(maxWidth: .infinity)
			.padding(.vertical, 20)
			.background(.white)
		}
    }
}

struct ButtonTabView: View {
	@Binding var selection: Int
	var numberList: Int
	var body: some View {
			Button {
				withAnimation {
					selection = numberList
				}
			} label: {
				HStack {
					switch numberList {
					case 1:
						Image(systemName: "flame")
						if selection == numberList {
							Text("Favourites")
						}
					case 2:
						Image(systemName: "timelapse")
						if selection == numberList {
							Text("Plot")
						}
					case 3:
						Image(systemName: "person.fill")
						if selection == numberList {
							Text("Setting")
						}
					default:
						Image(systemName: "globe")
						Text("#404")
					}
				}
				.padding(.vertical, 10)
				.padding(.horizontal, 20)
				.foregroundColor(.black)
				.background(.gray.opacity(0.5))
				.cornerRadius(20)
			}
	}
}


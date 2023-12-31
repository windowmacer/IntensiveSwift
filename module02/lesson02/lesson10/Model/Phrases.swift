//
//  Phrases.swift
//  lesson10
//
//  Created by Кирилл Арефьев on 20.06.2023.
//

import Foundation

class Phrases {
	private let str: [String] = [
		"11% людей на земле левши",
		"Глаз страуса больше, чем его мозг",
		"Гавайский алфавит состоит из 13 букв",
		"Рекордная длительность полёта курицы – 13 секунд",
		"В 1830-х годах кетчуп продавали как лекарство",
		"Белых медведей практически невозможно обнаружить с помощью тепловизора",
		"Ежедневно 60 человек становятся миллионерами",
		"За год на Землю падает до 500 кг марсианского метеорита",
		"Алмазы могут гореть",
		"Сердце и все функции организма останавливаются, когда человек чихает"
	]
	
	func getPhrases() -> String {
		if let line = self.str.randomElement() {
			return line
		}
		return "Факты закончились!"
	}
}

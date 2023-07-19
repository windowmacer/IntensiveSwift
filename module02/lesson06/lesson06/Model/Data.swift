//
//  Data.swift
//  lesson06
//
//  Created by Кирилл Арефьев on 16.07.2023.
//

import UIKit

struct DataTable {
	var name: String
	var image: UIImage?
	var text: String
}

var dataA = DataTable(name: "Programming language", image: UIImage(systemName: "c.circle.fill"), text: "C (programming language) is a general-purpose computer programming language. It was created in the 1970s by Dennis Ritchie, and remains very widely used and influential. By design, C's features cleanly reflect the capabilities of the targeted CPUs.")
var dataB = DataTable(name: "Biology", image: UIImage(systemName: "bird.fill"), text: "An organism is any biological living system that functions as an individual life form. All organisms are composed of cells (cell theory). The idea of organism is based on the concept of minimal functional unit of life.")
var dataC = DataTable(name: "Physics", image: UIImage(systemName: "atom"), text: "Classical physics is generally concerned with matter and energy on the normal scale of observation, while much of modern physics is concerned with the behavior of matter and energy under extreme conditions or on a very large or very small scale.")
var dataD = DataTable(name: "History", image: UIImage(systemName: "fossil.shell.fill"), text: "A major intellectual battle took place in Britain in the early twentieth century regarding the place of history teaching in the universities. At Oxford and Cambridge, scholarship was downplayed. Professor Charles Harding Firth, Oxford's Regius Professor of history in 1904 ridiculed the system as best suited to produce superficial journalists")
var dataE = DataTable(name: "Astronomy", image: UIImage(systemName: "moon.stars.fill"), text: "Galaxy groups and clusters are the largest known gravitationally bound objects to have arisen thus far in the process of cosmic structure formation. They form the densest part of the large-scale structure of the Universe. In models for the gravitational formation of structure with cold dark matter, the smallest structures collapse first and eventually build the largest structures, clusters of galaxies.")

import UIKit
/*
 Напишите функцию, которая принимает словарь типа [String: Int] и возвращает словарь такого же вида.
 Так же функция принимает клоужер, через который необходимо реализовать проверку значений,
 больше или меньше определенного числа.
 
 К примеру, вернуть словарь, где все значения больше 100 или вернуть словарь, где меньше 50.
 На каждое условие можно вызвать функцию по новой

*/

func filter(stringDict: [String: Int], funcClosure: (Int) -> Bool) -> [String: Int] {
	var result: [String: Int] = [:]
	for list in stringDict {
		if funcClosure(list.value) {
			result[list.key] = list.value
		}
	}
	return result
}

var tempDictionary: [String: Int] = ["Orlov" : 5, "Ivanov" : 4, "Petrov" : 2, "Sidorov" : 3]
let processingA = filter(stringDict: tempDictionary) {
	$0 > 3
}
print(processingA)


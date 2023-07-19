import UIKit

/*
 - Создать функцию, которая принимать массив из int и возвращать новый массив, который будет содержать только четные/нечетные числа
 - Написать простой калькулятор – функция принимает два аргумента float и принимает строку, символ операции и в зависимости команды, сделать математическую операцию с цифрами и вернуть результат
*/

// MARK: even and odd numbers

func evenNum(_ array: [Int]) -> [Int] {
	var result: [Int] = []
	
	for numb in array {
		if numb % 2 == 0 {
			result.append(numb)
		}
	}
	return result
}
//print(evenNum([1, 2, 3, 4]))

// MARK: Calculator

func nanoCalculator(first: Float, second: Float, operation: String) -> Float {
	if operation == "+" {
		return (first + second)
	} else if operation == "-" {
		return (first - second)
	} else if operation == "/" {
		return (first / second)
	} else {
		return (first * second)
	}
}

//print(nanoCalculator(first: 6, second: 2, operation: "*"))

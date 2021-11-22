//  Created by Макс on 19.11.2021.
import Foundation

/* Решение квадратного уравнения */
print("Предлагается решить уравнение формата ax^2 + bx + c = 0 с заданными Вами коэффициентами a, b и c.\n")

print("Введите коэффициент а: ")
let userAnsA = readLine()

print("Введите коэффициент b: ")
let userAnsB = readLine()

print("Введите коэффициент c: ")
let userAnsC = readLine()

var a: Double = 0
var b: Double = 0
var c: Double = 0

if userAnsA != nil && userAnsB != nil && userAnsC != nil { // Проверка на наличие значения и unwrap optional
    a += Double(userAnsA!)!
    b += Double(userAnsB!)!
    c += Double(userAnsC!)!
} else {
    print("Error")
}

var d: Double = (b * b) - (4 * a * c) // Подсчёт дискриминанта

if d < 0 {
    print("Корни отсутствуют")
} else if (d == 0) {
    let x1 = (-b + d) / 2 * a
    print("При данных коэффициентах мы получаем нулевой дискриминант, следовательно оба корня будут равны:\(x1).")
} else {
    let x1 = (-b + sqrt(d)) / 2 * a
    let x2 = (-b - sqrt(d)) / 2 * a
    print("Первый корень равен: \(x1), а второй: \(x2). \n \n")
}

/* Решение задачи с треугольником */
print("Предлагается ввести два катета треугольника для получения гиппотенузы, периметра, и площади треуголька.")

print("Введите первый катет треугольника: ")
let userCat1 = readLine()

print("Введите второй катет треугольника: ")
let userCat2 = readLine()

var cat1: Double = 0
var cat2: Double = 0
if userCat1 != nil && userCat2 != nil { // Проверка на наличие значения и unwrap optional
    cat1 += Double(userCat1!)!
    cat2 += Double(userCat2!)!
} else {
    print("Error")
}

let gippoten = round(sqrt(cat1 * cat1 + cat2 * cat2))
let perimetr = round(cat1 + cat2 + gippoten)
let square = 0.5 * cat1 * cat2

print("С данными катетами гиппотенуза будет равна: \(gippoten), площадь: \(square), а периметр: \(perimetr). \n \n")

/* Решение банковской задачи */
print("Предлагается рассчитать сумму дохода по банковскому вкладу с заданным процентом через 5 лет.")

print("Введите первоначальную сумму вклада:")
let userCashAmount = readLine()

print("Введите ежегодный процент по вкладу:")
let userPercentAmount = readLine()

var cashAmount: Double = 0
var percentAmount: Double = 0

if userCashAmount != nil && userPercentAmount != nil { // Проверка на наличие значения и unwrap optional
    cashAmount += Double(userCashAmount!)!
    percentAmount += Double(userPercentAmount!)! / 100
} else {
    print("Error")
}

for _ in 1...5 {
    cashAmount += cashAmount * percentAmount
}

print("Через 5 лет на вашем счету будет: \(round(cashAmount)).")

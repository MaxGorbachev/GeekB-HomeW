//  Created by Макс on 19.11.2021.
import Foundation

/* Решение задачи с определением чётности числа */
func evenCheck(number: Int) -> Bool {
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}

/* Решение задачи с делимостью на три без остатка */
func delThreeCheck(number: Int) -> Bool {
    if number % 3 == 0 {
        return true
    } else {
        return false
    }
}

/* Решение задаачи с созданием возрастающего массива из 100 чисел */
func arrayGenerate(length: Int) -> Array<Int> {
    var numbersArray = [Int]()
    var numberForArray = 0
    for _ in 1...length {
        numbersArray.append(numberForArray)
        numberForArray += 1
    }

    return numbersArray
}

var numbersArray = arrayGenerate(length: 100)


/* Решение задачи с удалением из массива чётные числа и числа кратные трём */
numbersArray = numbersArray.filter({($0 % 2 != 0) && ($0 % 3 == 0)})

/* Решение задачи с числами Фибоначчи */
var fibonacciArr = [0, 1]
var newFibNum = 1
var oldFibNum = 1

for _ in 3...50 {
    fibonacciArr.append(newFibNum)
    let numTransfer = newFibNum
    newFibNum += oldFibNum
    oldFibNum = numTransfer
}

/* Решение шестой задачи */
var simpleArray = [Int](1...100)
let maxOfArray = simpleArray.max()!
var p = 2
while p * p < maxOfArray {
    simpleArray = simpleArray.filter({$0 % p != 0})
    p += 1
}

import Foundation
enum WashingBoxError: Error {
    case moneyAmountError
    case stockAmountError
    case stockMissnameError
}

struct Stock {
    let name: Liquid
    var stockAmount: UInt
    let pricePerGallon: UInt
}

struct Liquid {
    let name: String
}

class WashingBox {
    var stock = ["Water": Stock(name: Liquid(name: "Water"), stockAmount: 400, pricePerGallon: 5),
                 "Soap": Stock(name: Liquid(name: "Soap"), stockAmount: 100, pricePerGallon: 20),
                 "Wax": Stock(name: Liquid(name: "Wax"), stockAmount: 50, pricePerGallon: 40),
                 "Ceramic": Stock(name: Liquid(name: "Ceramic"), stockAmount: 20, pricePerGallon: 100)
    ]

    func washMyCar(liquidType: String, cashDeposit: UInt, liquidAmount: UInt) throws -> Liquid? {
        var moneyDeposit = cashDeposit
        guard let liquid = stock[liquidType] else { throw WashingBoxError.stockMissnameError}
        guard liquid.stockAmount >= liquidAmount else { throw WashingBoxError.stockAmountError}
        guard liquid.pricePerGallon * liquidAmount <= cashDeposit else { throw WashingBoxError.moneyAmountError }

        var newLiquid = liquid
        newLiquid.stockAmount -= liquidAmount
        moneyDeposit -= newLiquid.pricePerGallon * liquidAmount
        stock[liquidType] = newLiquid
        print("You can wash your car with \(liquidAmount) of \(liquidType).")
        moneyDeposit != 0 ? print("Your change is \(moneyDeposit).") : nil

        return newLiquid.name
    }
}

let washBox = WashingBox()
do {
    try washBox.washMyCar(liquidType: "Water", cashDeposit: 1000, liquidAmount: 20)
} catch let error {
    print(error)
}

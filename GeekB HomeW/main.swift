// MARK: - Enums
    enum EngineOn: String {

        case isOn
        case isOff
    }

    enum WindowsStatus: String {

        case opened
        case closed
    }

    enum TrunkStatus: String {

        case opened
        case closed
    }

    enum DoorsStatus: String {

        case opened
        case closed
    }

    enum LightsStatus: String {

        case on
        case off
    }

    enum TrunkFilling {

        case load(amount: UInt)
        case unload(amount: UInt)
    }

// MARK: - Classes

class Car {
    var carBrand: String
    var yearOfProd: UInt
    var engineVolume: Float
    var carMaxSpeed: UInt
    static let carPossibleSpeed: UInt = 300
    var trunkCapacity: UInt
    var trunkFullness: UInt = 0
    var windowsOpened: WindowsStatus = .closed
    var doorsOpened: DoorsStatus = .closed
    var trunkOpen: TrunkStatus = .closed
    var lightsOn: LightsStatus = .off
    var engineOn: EngineOn = .isOff

    init(carBrand: String,
         yearOfProd: UInt,
         engineVolume: Float,
         carMaxSpeed: UInt,
         trunkCapacity: UInt,
         trunkFullness: UInt = 0) {

        self.carBrand = carBrand
        self.yearOfProd = yearOfProd
        self.engineVolume = engineVolume
        self.trunkCapacity = trunkCapacity
        self.trunkFullness = trunkFullness

        if carMaxSpeed > Car.carPossibleSpeed {

            print("Введено недопустимое значение. Установлено максимально возможное значение: 300 км/ч.")
            self.carMaxSpeed = Car.carPossibleSpeed

        } else {

            self.carMaxSpeed = carMaxSpeed

        }
    }

    func lightsAccess(status: LightsStatus) {

        lightsOn = status
        print("Now lights are \(status).")

    }

    func windowsAccess(status: WindowsStatus) {

        windowsOpened = status
        print("Now, windows are \(status).")

    }

    func doorsAccess(status: DoorsStatus) {

        doorsOpened = status
        print("Now, doors are \(status).")

    }

    func trunkAccess(status: TrunkStatus) {

        trunkOpen = status
        print("Now trunk is \(status).")

    }

    func trunkLoadness(status: TrunkFilling) {

        switch status {

        case let .load(amount):
            if (trunkOpen == .closed) {
                print("Open the trunk before loading.")
            } else if amount <= (trunkCapacity - trunkFullness) {
                print("Car is loaded with \(amount).")
                trunkFullness += amount
            } else {
                print("Couldn't load that amount of weight.")
                print("It's only possible to put \(trunkCapacity - trunkFullness) in.")
            }
        case let .unload(amount):
            if trunkOpen == .closed {
                print("Open the trunk before unloading.")
            } else if amount >= trunkFullness {
                print("Car is fully unloaded.")
                trunkFullness = 0
            } else {
                print("Car is unloaded with \(amount) and now is loaded with \(trunkFullness)")
                trunkFullness -= amount
            }
        }
    }


}

final class SportCar: Car {

func carInfo() {
        print("One of the cars, branded as: \(carBrand), built in \(yearOfProd).")
        print("Engine volume is \(engineVolume), and maximum speed is: \(carMaxSpeed).")
        print("Windows are \(windowsOpened) and doors are \(doorsOpened).")
        print("Trunk capacity is \(trunkCapacity) with \(trunkFullness) used.")
    }
    
}


final class TrunkCar: Car {

    func aboutTruck() {
        print("This truck is branded as: \(carBrand), builr in \(yearOfProd).")
        print("Engine volume is \(engineVolume), and maximum speed is: \(carMaxSpeed).")
        print("Windows are \(windowsOpened) and doors are \(doorsOpened). Lights are \(lightsOn).")
        print("Trunk capacity is \(trunkCapacity) with \(trunkFullness) used.")
    }

}

var sportCar = SportCar(carBrand: "BMW", yearOfProd: 2020, engineVolume: 550, carMaxSpeed: 400, trunkCapacity: 550)
sportCar.carInfo()
sportCar.lightsAccess(status: .on)
sportCar.doorsAccess(status: .opened)
sportCar.trunkAccess(status: .opened)
sportCar.trunkLoadness(status: .load(amount: 320))
sportCar.trunkAccess(status: .closed)
print("")
sportCar.carInfo()
print("")

var truck = TrunkCar(carBrand: "MAN", yearOfProd: 2016, engineVolume: 700, carMaxSpeed: 240, trunkCapacity: 20000)
truck.windowsAccess(status: .opened)
truck.lightsAccess(status: .on)
truck.trunkLoadness(status: .load(amount: 40000))
sportCar.trunkAccess(status: .opened)
print("")
truck.aboutTruck()
print("")

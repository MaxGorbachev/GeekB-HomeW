/// Структура, описывающая объект легкового автомобиля,
/// включает в себя ряд конфигурационных свойств для деталей данного объекта.
struct SportCar {

    enum EngineOn {

        case isOn
        case isOff
    }

    enum WindowsStatus {

        case opened
        case closed
    }

    enum TrunkStatus {

        case opened
        case closed
    }

    enum DoorsStatus {

        case opened
        case closed
    }

    enum LightsStatus {

        case on
        case off
    }

    enum TrunkFilling {

        case load(amount: UInt)
        case unload(amount: UInt)
    }

    let carBrand: String
    let yearOfProd: UInt
    let engineVolume: Float
    let carMaxSpeed: UInt
    static let carPossibleSpeed: UInt = 300
    let trunkCapacity: UInt
    var trunkFullness: UInt = 0
    var windowsOpened: WindowsStatus = .closed
    var doorsOpened: DoorsStatus = .closed
    var trunkOpen: TrunkStatus = .closed
    var lightsOn: LightsStatus = .off
    var engineOn: EngineOn = .isOff

    init(carBrand: String, yearOfProd: UInt, engineVolume: Float, carMaxSpeed: UInt, trunkCapacity: UInt,
         trunkFullness: UInt = 0) {

        self.carBrand = carBrand
        self.yearOfProd = yearOfProd
        self.engineVolume = engineVolume
        self.trunkCapacity = trunkCapacity
        self.trunkFullness = trunkFullness

        if carMaxSpeed > SportCar.carPossibleSpeed {

            print("Введено недопустимое значение. Установлено максимально возможное значение: 300 км/ч.")
            self.carMaxSpeed = SportCar.carPossibleSpeed

        } else {

            self.carMaxSpeed = carMaxSpeed

        }

        print("One of the cars, branded as: \(self.carBrand), built in \(self.yearOfProd).")
        print("Engine volume is \(self.engineVolume), and maximum speed is: \(self.carMaxSpeed).")
        print("Windows are \(self.windowsOpened) and doors are \(self.doorsOpened).")
        print("Trunk capacity is \(self.trunkCapacity) with \(self.trunkFullness) used.")
    }

    mutating func lightsAccess(status: LightsStatus) {

        self.lightsOn = status
        print("Now lights are \(status).")

    }

    mutating func windowsAccess(status: WindowsStatus) {

        self.windowsOpened = status
        print("Now, windows are \(status).")

    }

    mutating func doorsAccess(status: DoorsStatus) {

        self.doorsOpened = status
        print("Now, doors are \(status).")

    }

    mutating func trunkAccess(status: TrunkStatus) {

        self.trunkOpen = status
        print("Now trunk is \(status).")

    }

    mutating func trunkLoadness(status: TrunkFilling) {

        switch status {

        case let .load(amount):
            if (self.trunkOpen == .closed) {
                print("Open the trunk before loading.")
            } else if amount <= (trunkCapacity - trunkFullness) {
                print("Car is loaded with \(amount).")
                self.trunkFullness += amount
            } else {
                print("Couldn't load that amount of weight.")
                print("It's only possible to put \(trunkCapacity - trunkFullness) in.")
            }
        case let .unload(amount):
            if self.trunkOpen == .closed {
                print("Open the trunk before unloading.")
            } else if amount >= trunkFullness {
                print("Car is fully unloaded.")
                self.trunkFullness = 0
            } else {
                print("Car is unloaded with \(amount) and now is loaded with \(trunkFullness)")
                self.trunkFullness -= amount
            }
        }
    }

    func aboutCar() {
        print("This car is branded as: \(self.carBrand), built in \(self.yearOfProd).")
        print("Engine volume is \(self.engineVolume), and maximum speed is: \(self.carMaxSpeed).")
        print("Windows are \(self.windowsOpened) and doors are \(self.doorsOpened). Lights are \(self.lightsOn).")
        print("Trunk capacity is \(self.trunkCapacity) with \(self.trunkFullness) used.")
    }
}

/// Структура, описывающая объект грузового автомобиля,
/// включает в себя ряд конфигурационных свойств для деталей данного объекта.
struct TrunkCar {

    enum EngineOn {

        case isOn
        case isOff
    }

    enum WindowsStatus {

        case opened
        case closed
    }

    enum TrunkStatus {

        case opened
        case closed
    }

    enum DoorsStatus {

        case opened
        case closed
    }

    enum LightsStatus {

        case on
        case off
    }

    enum TrunkFilling {

        case load(amount: UInt)
        case unload(amount: UInt)
    }

    let truckBrand: String
    let yearOfProd: UInt
    let engineVolume: Float
    let truckMaxSpeed: UInt
    static let truckPossibleSpeed: UInt = 200
    let trunkCapacity: UInt
    var trunkFullness: UInt = 0
    var windowsOpened: WindowsStatus = .closed
    var doorsOpened: DoorsStatus = .closed
    var trunkOpen: TrunkStatus = .closed
    var lightsOn: LightsStatus = .off
    var engineOn: EngineOn = .isOff

    init(truckBrand: String, yearOfProd: UInt, engineVolume: Float, truckMaxSpeed: UInt, trunkCapacity: UInt,
         trunkFullness: UInt = 0) {

        self.truckBrand = truckBrand
        self.yearOfProd = yearOfProd
        self.engineVolume = engineVolume
        self.trunkCapacity = trunkCapacity
        self.trunkFullness = trunkFullness

        if truckMaxSpeed > TrunkCar.truckPossibleSpeed {

            print("Введено недопустимое значение. Установлено максимально возможное значение: 200 км/ч.")
            self.truckMaxSpeed = TrunkCar.truckPossibleSpeed

        } else {

            self.truckMaxSpeed = truckMaxSpeed

        }

        print("One of the trucks, branded as: \(self.truckBrand), built in \(self.yearOfProd).")
        print("Engine volume is \(self.engineVolume), and maximum speed is: \(self.truckMaxSpeed).")
        print("Windows are \(self.windowsOpened) and doors are \(self.doorsOpened).")
        print("Trunk capacity is \(self.trunkCapacity) with \(self.trunkFullness) used.")
    }

    mutating func lightsAccess(status: LightsStatus) {

        self.lightsOn = status
        print("Now lights are \(status).")

    }

    mutating func windowsAccess(status: WindowsStatus) {

        self.windowsOpened = status
        print("Now, windows are \(status).")

    }

    mutating func doorsAccess(status: DoorsStatus) {

        self.doorsOpened = status
        print("Now, doors are \(status).")

    }

    mutating func trunkAccess(status: TrunkStatus) {

        self.trunkOpen = status
        print("Now trunk is \(status).")

    }

    mutating func trunkLoadness(status: TrunkFilling) {

        switch status {

        case let .load(amount):
            if (self.trunkOpen == .closed) {
                print("Open the trunk before loading.")
            } else if amount <= (trunkCapacity - trunkFullness) {
                print("Truck is loaded with \(amount).")
                self.trunkFullness += amount
            } else {
                print("Couldn't load that amount of weight.")
                print("It's only possible to put \(trunkCapacity - trunkFullness) in.")
            }
        case let .unload(amount):
            if self.trunkOpen == .closed {
                print("Open the trunk before unloading.")
            } else if amount >= trunkFullness {
                print("Car is fully unloaded.")
                self.trunkFullness = 0
            } else {
                print("Truck is unloaded with \(amount) and now is loaded with \(trunkFullness)")
                self.trunkFullness -= amount
            }
        }
    }

    func aboutCar() {
        print("This truck is branded as: \(self.truckBrand), builr in \(self.yearOfProd).")
        print("Engine volume is \(self.engineVolume), and maximum speed is: \(self.truckMaxSpeed).")
        print("Windows are \(self.windowsOpened) and doors are \(self.doorsOpened). Lights are \(self.lightsOn).")
        print("Trunk capacity is \(self.trunkCapacity) with \(self.trunkFullness) used.")
    }
}

var sportCar = SportCar(carBrand: "BMW", yearOfProd: 2020, engineVolume: 550, carMaxSpeed: 400, trunkCapacity: 550)

sportCar.lightsAccess(status: .on)
sportCar.doorsAccess(status: .opened)
sportCar.trunkAccess(status: .opened)
sportCar.trunkLoadness(status: .load(amount: 320))
print("")
sportCar.aboutCar()
print("")

var truck = TrunkCar(truckBrand: "MAN", yearOfProd: 2016, engineVolume: 700, truckMaxSpeed: 240, trunkCapacity: 20000)
truck.windowsAccess(status: .opened)
truck.lightsAccess(status: .on)
truck.trunkLoadness(status: .load(amount: 40000))
print("")
truck.aboutCar()
print("")

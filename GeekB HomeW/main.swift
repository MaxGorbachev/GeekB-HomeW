protocol MoneyAmountProtocol {
    var billsCount: Int { get set }
}

enum DollarBill {
    case oneDollar
    case twoDollars
    case fiveDollars
    case tenDollars
    case hundredDollars
}

struct Bill: MoneyAmountProtocol {
    var billsCount: Int
    var billAmount: DollarBill
}

extension Bill: CustomStringConvertible {
    var description: String {
        return "There is \(billsCount) of \(billAmount) in the pocket"
    }
}

struct Queue <T: MoneyAmountProtocol> {
    private var bills: [T] = []

    mutating func add(bill: T) {
        bills.append(bill)
    }

    mutating func removeFirst() {
        bills.removeFirst()
    }

    mutating func removeLast() {
        bills.removeLast()
    }

    mutating func removeElement(position: Int)  {
        if position < bills.count {
            bills.remove(at: position)
        } else { print("There's no \(position) position in this queue.") }
    }
}

extension Queue {
    func filtred (chosenCondition: (T) -> Bool) -> Queue<T> {
        var newQueue = Queue<T>()
        for value in bills where chosenCondition(value) {
            newQueue.add(bill: value)
        }
        return newQueue
    }
}


// Tests

var wallet = Queue<Bill>()

wallet.add(bill: .init(billsCount: 14, billAmount: .fiveDollars))
wallet.add(bill: .init(billsCount: 11, billAmount: .hundredDollars))
print(wallet)
wallet.removeLast()
print(wallet)
wallet.add(bill: .init(billsCount: 5, billAmount: .hundredDollars))
wallet.add(bill: .init(billsCount: 6, billAmount: .tenDollars))
wallet.add(bill: .init(billsCount: 12, billAmount: .fiveDollars))
wallet.add(bill: .init(billsCount: 9, billAmount: .twoDollars))
print(wallet)
wallet = wallet.filtred(chosenCondition: {$0.billsCount < 10})
print(wallet)

protocol Drink: Item {}

class Coffee: Drink {
    enum Kind: CaseIterable {
        case cappucino
        case americano
        case espresso
        case macchiato
        case latte
    }

    static let name: String = "Coffee"
    let kind: Kind

    init(kind: Kind) {
        self.kind = kind
    }

    var id: String {
        return "\(Coffee.name)-\(kind)"
    }
}

class Tea: Drink {
    enum Kind: CaseIterable {
        case black
        case green
        case white
        case fruit
    }

    static let name: String = "Tea"
    let kind: Kind

    init(kind: Kind) {
        self.kind = kind
    }

    var id: String {
        return "\(Tea.name)-\(kind)"
    }
}

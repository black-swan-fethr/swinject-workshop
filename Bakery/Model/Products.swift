enum FlourType {
    case allPurpose
    case bread
    case wholeWheat
    case whiteWholeWheat
    case oat
}

protocol Product: Food {
    var flour: FlourType { get }
}

class Bread: Product {
    static let name: String = "Bread"
    let flour: FlourType

    init(flour: FlourType) {
        self.flour = flour
    }
}

class Bagel: Product {
    enum Style {
        case montreal
        case newYork
        case eastCoast
        case stLouise
        case other
    }

    static let name: String = "Bagel"
    let flour: FlourType
    let style: Style

    init(flour: FlourType, style: Style) {
        self.flour = flour
        self.style = style
    }
}

class Croissant: Product {
    enum Kind {
        case none
        case chocolate
        case vanilla
        case cheese
    }

    static let name: String = "Croissant"
    let flour: FlourType
    let kind: Kind

    init(flour: FlourType, kind: Kind) {
        self.flour = flour
        self.kind = kind
    }
}

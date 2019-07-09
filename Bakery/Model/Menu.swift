protocol Menu {
    var items: [Item] { get }
}

class StartTheDayMenu: Menu {
    let drink: Drink
    let meal: Food

    init(drink: Drink, meal: Food) {
        self.drink = drink
        self.meal = meal
    }

    var items: [Item] {
        return [drink, meal]
    }
}

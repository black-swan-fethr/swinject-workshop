class Sandwich: Item, Food {
    enum Topping: CaseIterable {
        case ham
        case cheese
        case salami
        case butter
    }

    static let name: String = "Sandwich"
    let product: Product
    let toppings: [Topping]

    init(product: Product, toppings: [Topping]) {
        self.product = product
        self.toppings = toppings
    }

    var id: String {
        return "\(Sandwich.name)-\(product.id)-\(toppings)"
    }
}

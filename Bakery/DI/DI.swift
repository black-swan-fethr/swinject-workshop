import Swinject

enum DI {
    // This is a lazily initialized single instance as per the Swift Documentation
    static let container = Container()


    static func register() {
        // MARK-0-1
        // Most basic registration: default impl behind interface
        container.register(Product.self) { _ in
            Bread(flour: .bread)
        }

        // MARK-0-2
        // Inject a default instance of a class with a registered dependency
        container.register(Sandwich.self) { resolver in
            Sandwich(product: resolver.resolve(Product.self)!, toppings: [.butter, .ham, .cheese])
        }

        // MARK-0-3
        // Inject default types of our products based on their names
        container.register(Product.self, name: Bread.name) { _ in
            Bread(flour: .bread)
        }

        container.register(Product.self, name: Bagel.name) { _ in
            Bagel(flour: .allPurpose, style: .eastCoast)
        }

        container.register(Product.self, name: Croissant.name) { _ in
            Croissant(flour: .allPurpose, kind: .none)
        }

        // MARK-0-4
        // We can use registered factory methods in our registrations
        // This is a bit shaky example, just for the sake of the presentation
        container.register(Bagel.self) { resolver in
            return resolver.resolve(Product.self, name: Bagel.name) as! Bagel
        }

        // MARK-0-5
        // With arguments
        container.register(Croissant.self) { resolver in
            Croissant(flour: .allPurpose, kind: .none)
        }

        container.register(Croissant.self) { resolver, flour in
            Croissant(flour: flour, kind: .none)
        }

        container.register(Croissant.self) { resolver, flour, kind in
            Croissant(flour: flour, kind: kind)
        }
    }
}

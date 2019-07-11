import Swinject

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container
            .autoregister(ItemService.self, initializer: RandomItemService.init)
            .inObjectScope(.container)
    }
}

// To simulate framework only implementation
private class RandomItemService: ItemService {
    func fetchItems() -> [Item] {
        return items
    }

    static func allItems() -> [Item] {
        var items: [Item] = []

        items.append(contentsOf: Coffee.Kind.allCases.map { Coffee(kind: $0) })
        items.append(contentsOf: Tea.Kind.allCases.map { Tea(kind: $0) })

        items.append(contentsOf: FlourType.allCases.flatMap { flour in
            Bagel.Style.allCases.map { Bagel(flour: flour, style: $0) } +
                Croissant.Kind.allCases.map { Croissant(flour: flour, kind: $0) } +
                [ Bread(flour: flour) ]
        })

        return items
    }

    var items: [Item] = {
        let all = allItems()
        return (0 ... Int.random(in: 10 ..< 20)).map { _ in
            all[Int.random(in: 0 ..< all.count)]
        }
    }()
}

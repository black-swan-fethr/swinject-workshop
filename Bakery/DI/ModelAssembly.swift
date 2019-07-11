import Swinject

class ModelAssembly: Assembly {
    func assemble(container: Container) {
        container
            .register(WorkDay.self) { resolver in
                ConcreteWorkDay(inventory: resolver.resolve(Inventory.self)!)
            }
            .inObjectScope(.weak)

        container
            .register(Inventory.self) { resolver in
                RandomInventory(itemProvider: resolver.resolve(ItemProviding.self)!)
            }
            .inObjectScope(.weak)
    }
}

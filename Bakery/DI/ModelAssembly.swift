import Swinject
import SwinjectAutoregistration

class ModelAssembly: Assembly {
    func assemble(container: Container) {
        container
            .autoregister(WorkDay.self, initializer: ConcreteWorkDay.init)
            .inObjectScope(.weak)

        container
            .autoregister(Inventory.self, initializer: RandomInventory.init)
            .inObjectScope(.weak)
    }
}

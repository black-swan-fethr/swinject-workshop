import Swinject

class ProviderAssembly: Assembly {
    func assemble(container: Container) {
        container
            .autoregister(ItemProviding.self, initializer: ItemProvider.init)
    }
}

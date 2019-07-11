import Swinject

class ProviderAssembly: Assembly {
    func assemble(container: Container) {
        container
            .register(ItemProviding.self) { resolver in
                ItemProvider(itemService: resolver.resolve(ItemService.self)!)
            }
    }
}

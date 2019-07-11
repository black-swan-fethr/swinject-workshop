import Swinject

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container
            .autoregister(StoreViewModelInterface.self, initializer: StoreViewModel.init)
            .inObjectScope(.transient)

        container
            .autoregister(StoreSearchViewModelInterface.self, initializer: StoreSearchViewModel.init)
            .inObjectScope(.transient)
            .implements(ExtraInterfaceThatSearchIsCompliantTo.self)
    }
}

protocol ExtraInterfaceThatSearchIsCompliantTo {}
extension StoreSearchViewModel: ExtraInterfaceThatSearchIsCompliantTo {}

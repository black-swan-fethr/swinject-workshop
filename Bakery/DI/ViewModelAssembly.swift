import Swinject

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container
            .register(StoreViewModelInterface.self) { resolver in
                StoreViewModel(
                    workDay: resolver.resolve(WorkDay.self)!,
                    itemProvider: resolver.resolve(ItemProviding.self)!
                )
            }
            .inObjectScope(.transient)

        container
            .register(StoreSearchViewModelInterface.self) { resolver in
                StoreSearchViewModel()
            }
            .inObjectScope(.transient)
    }
}

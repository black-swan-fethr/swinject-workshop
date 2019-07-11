import Swinject

enum DI {
    static let serviceContainer = Container()
    static let modelContainer = Container(parent: DI.serviceContainer)
    static let viewModelContainer = Container(parent: DI.modelContainer)
    static let viewContainer = Container(parent: DI.viewModelContainer)

    static func register() {
        viewContainer
            .register(StoreViewController.self) { _ in
                return UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! StoreViewController
            }
            .initCompleted { resolver, vc in
                vc.viewModel = resolver.resolve(StoreViewModelInterface.self)
            }
            .inObjectScope(.transient)

        viewContainer
            .register(StoreSearchViewController.self) { _ in
                return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoreSearchViewController.storyboardId) as! StoreSearchViewController
            }
            .initCompleted { resolver, vc in
                vc.viewModel = resolver.resolve(StoreSearchViewModelInterface.self)
            }
            .inObjectScope(.transient)

        viewModelContainer
            .register(StoreViewModelInterface.self) { resolver in
                StoreViewModel(
                    workDay: resolver.resolve(WorkDay.self)!,
                    itemProvider: resolver.resolve(ItemProviding.self)!
                )
            }
            .inObjectScope(.transient)

        viewModelContainer
            .register(StoreSearchViewModelInterface.self) { resolver in
                StoreSearchViewModel()
            }
            .inObjectScope(.transient)

        modelContainer
            .register(ItemProviding.self) { resolver in
                ItemProvider(itemService: resolver.resolve(ItemService.self)!)
            }

        modelContainer
            .register(WorkDay.self) { resolver in
                ConcreteWorkDay(inventory: resolver.resolve(Inventory.self)!)
            }
            .inObjectScope(.weak)

        modelContainer
            .register(Inventory.self) { resolver in
                RandomInventory(itemProvider: resolver.resolve(ItemProviding.self)!)
            }
            .inObjectScope(.weak)

        serviceContainer
            .register(ItemService.self) { resolver in
                RandomItemService()
            }
            .inObjectScope(.container)
    }
}

import Swinject

class ViewAssembly: Assembly {
    func assemble(container: Container) {
        container
            .register(StoreViewController.self) { _ in
                return UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! StoreViewController
            }
            .initCompleted { resolver, vc in
                vc.viewModel = resolver.resolve(StoreViewModelInterface.self)
            }
            .inObjectScope(.transient)

        container
            .register(StoreSearchViewController.self) { _ in
                return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoreSearchViewController.storyboardId) as! StoreSearchViewController
            }
            .initCompleted { resolver, vc in
                vc.viewModel = resolver.resolve(StoreSearchViewModelInterface.self)
            }
            .inObjectScope(.transient)
    }

    func loaded(resolver: Resolver) {
        print("View assembly loaded")
    }
}

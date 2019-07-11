import Swinject
import SwinjectStoryboard

class ViewAssembly: Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(StoreViewController.self) { resolver, vc in
            vc.viewModel = resolver.resolve(StoreViewModelInterface.self)
        }

        container.storyboardInitCompleted(StoreSearchViewController.self) { resolver, vc in
            vc.viewModel = resolver.resolve(StoreSearchViewModelInterface.self)
        }
    }

    func loaded(resolver: Resolver) {
        print("View assembly loaded")
    }
}

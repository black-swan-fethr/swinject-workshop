protocol StoreSearchViewModelInterface {
    func filter(to filter: String?)

    var titleChangeHandler: ((String) -> Void)? { get set }
    var itemsChangeHandler: ((String) -> Void)? { get set }
}

class StoreSearchViewModel: StoreSearchViewModelInterface {
    private let title = "Search from VM"
    private var itemProvider: ItemProviding

    init() {
        self.itemProvider = DI.container.resolve(ItemProviding.self)!
    }

    func filter(to filter: String?) {
        itemProvider.set(filter: filter)
        itemsChangeHandler?(itemProvider.getItems().map { $0.id }.sorted(by: <).joined(separator: "\n"))
    }

    var titleChangeHandler: ((String) -> Void)? {
        didSet { titleChangeHandler?(title) }
    }

    var itemsChangeHandler: ((String) -> Void)? {
        didSet { itemsChangeHandler?("") }
    }
}

protocol StoreViewModelInterface {
    var title: String { get }
    func setItems(_ items: [Item])
}

class StoreViewModel: StoreViewModelInterface {
    let title = "Bakery from VM"

    private var items: [Item] = []

    func setItems(_ items: [Item]) {
        self.items = items
    }
}

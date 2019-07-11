protocol StoreViewModelInterface {
    var titleChangeHandler: ((String) -> Void)? { get set }
    var itemsChangeHandler: ((String) -> Void)? { get set }

    func reset()
}

class StoreViewModel: StoreViewModelInterface {
    private let title = "Bakery from VM"
    private var workDay: WorkDay?
    private var itemProvider: ItemProviding

    init(workDay: WorkDay, itemProvider: ItemProviding) {
        self.workDay = workDay
        self.itemProvider = itemProvider
    }

    var titleChangeHandler: ((String) -> Void)? {
        didSet { titleChangeHandler?(title) }
    }

    var itemsChangeHandler: ((String) -> Void)? {
        didSet { itemsChangeHandler?(displayItemsFromInventory()) }
    }

    func reset() {
        // A bit forced but for the simplicity of the demo let's just nil this out and give it a new value
        workDay = nil
        workDay = DI.container.resolve(WorkDay.self)!
        itemsChangeHandler?(displayItemsFromInventory())
    }

    private func displayItemsFromInventory() -> String {
        return workDay?
            .inventory
            .actualStockForTheDay
            .sorted(by: { $0.key < $1.key })
            . map { "\($0.key): \($0.value)" }
            .joined(separator: "\n")
            ?? ""
    }
}

protocol WorkDay {
    var inventory: Inventory { get }
}

class ConcreteWorkDay: WorkDay {
    private(set) var inventory: Inventory

    init(inventory: Inventory) {
        self.inventory = inventory
    }
}

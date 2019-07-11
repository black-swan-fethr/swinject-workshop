import Foundation

protocol ItemProviding {
    func getItems() -> [Item]
    func set(filter: String?)
}

class ItemProvider: ItemProviding {
    private let itemService: ItemService
    private var filter: String?

    private var items: [Item] = []

    init(itemService: ItemService) {
        self.itemService = itemService
    }

    func getItems() -> [Item] {
        if items.isEmpty {
            items = itemService.fetchItems()
        }

        guard let filter = filter else {
            return items
        }

        return items.filter { $0.id.starts(with: filter) }
    }

    func set(filter: String?) {
        self.filter = filter
    }
}

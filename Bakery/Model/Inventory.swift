protocol Inventory {
    var baseStock: [String: Int] { get }
    var stockDeviation: [String: Int] { get }
    var actualStockForTheDay: [String: Int] { get }
}

class RandomInventory: Inventory {
    private(set) var baseStock: [String: Int]
    private(set) var stockDeviation: [String: Int]

    init(itemProvider: ItemProviding) {
        baseStock = itemProvider.getItems().reduce(into: [String: Int]()) { $0[$1.id] = Int.random(in: 0..<20) }
        stockDeviation = itemProvider.getItems().reduce(into: [String: Int]()) { $0[$1.id] = Int.random(in: -20..<20) }
    }

    var actualStockForTheDay: [String : Int] {
        return baseStock.merging(stockDeviation) { $0 + $1 }
    }
}

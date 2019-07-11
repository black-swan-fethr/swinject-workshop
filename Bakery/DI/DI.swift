import Swinject

enum DI {
    private static let assembler = Assembler([
        // Order does not effect factory methods
        ModelAssembly(),
        ProviderAssembly(),
        ServiceAssembly(),
        ViewModelAssembly(),
        ViewAssembly()
    ])

    static var resolver: Resolver {
        return (assembler.resolver as! Container).synchronize()
    }
}

public struct Lib: Sendable {
    public let name: String

    public init(name: String) {
        self.name = name
    }

    public func message() -> String {
        "Hello from Lib, imported as LibAlias: \(name)"
    }
}

import Foundation

public struct EmpApp: Sendable {
    public let id: String
    public let scheme: String
    public let displayName: String
    public let actions: [AppAction]

    public init(id: String, scheme: String, displayName: String, actions: [AppAction]) {
        self.id = id
        self.scheme = scheme
        self.displayName = displayName
        self.actions = actions
    }
}

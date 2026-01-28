import Foundation

public enum ActionType: String, Codable, Sendable {
    case create
    case open
}

public struct AppAction: Sendable {
    public let type: ActionType
    public let label: String
    public let icon: String

    public init(type: ActionType, label: String, icon: String) {
        self.type = type
        self.label = label
        self.icon = icon
    }
}

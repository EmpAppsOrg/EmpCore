import Foundation

public enum TaskStatus: String, Codable, Sendable {
    case todo
    case inProgress
    case done
}

import Foundation

public enum ContactFieldType: String, Codable, Sendable, Equatable {
    case text
    case date
    case number
    case url
    case selection
}

import Foundation

public struct Tag: EmpModel, Equatable, Hashable, Sendable {
    public let id: UUID
    public let createdAt: Date
    public var updatedAt: Date
    public var isDeleted: Bool
    public var name: String
    public var color: String

    public init(
        id: UUID = UUID(),
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        isDeleted: Bool = false,
        name: String,
        color: String,
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isDeleted = isDeleted
        self.name = name
        self.color = color
    }
}

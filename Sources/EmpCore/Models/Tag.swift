import Foundation

public struct Tag: EmpModel, Equatable, Hashable, Sendable {
    public let id: UUID
    public let createdAt: Date
    public var updatedAt: Date
    public var isDeleted: Bool
    public var name: String
    public var color: String
    public var parentPath: String?
    public var depth: Int

    public var displayName: String {
        components.last ?? name
    }

    public var components: [String] {
        name.split(separator: ".").map(String.init)
    }

    public var isRoot: Bool {
        depth == 0
    }

    public init(
        id: UUID = UUID(),
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        isDeleted: Bool = false,
        name: String,
        color: String,
        parentPath: String? = nil,
        depth: Int? = nil
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isDeleted = isDeleted
        self.name = name
        self.color = color
        self.parentPath = parentPath
        let parts = name.split(separator: ".")
        self.depth = depth ?? max(0, parts.count - 1)
        if self.parentPath == nil, parts.count > 1 {
            self.parentPath = parts.dropLast().joined(separator: ".")
        }
    }
}

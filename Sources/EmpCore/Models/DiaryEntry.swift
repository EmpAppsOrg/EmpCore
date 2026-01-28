import Foundation

public struct DiaryEntry: EmpModel, Equatable, Sendable {
    public let id: UUID
    public let createdAt: Date
    public var updatedAt: Date
    public var isDeleted: Bool
    public var title: String
    public var body: AttributedString
    public var tags: [Tag]
    public var links: [EmpLink]

    public init(
        id: UUID = UUID(),
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        isDeleted: Bool = false,
        title: String,
        body: AttributedString = AttributedString(),
        tags: [Tag] = [],
        links: [EmpLink] = []
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isDeleted = isDeleted
        self.title = title
        self.body = body
        self.tags = tags
        self.links = links
    }
}

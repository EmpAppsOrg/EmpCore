import Foundation

public struct TaskItem: EmpModel, Equatable, Sendable {
    public let id: UUID
    public let createdAt: Date
    public var updatedAt: Date
    public var isDeleted: Bool
    public var title: String
    public var body: String
    public var status: TaskStatus
    public var priority: TaskPriority
    public var deadline: Date?
    public var tags: [Tag]
    public var links: [EmpLink]

    public init(
        id: UUID = UUID(),
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        isDeleted: Bool = false,
        title: String,
        body: String = "",
        status: TaskStatus = .todo,
        priority: TaskPriority = .medium,
        deadline: Date? = nil,
        tags: [Tag] = [],
        links: [EmpLink] = []
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isDeleted = isDeleted
        self.title = title
        self.body = body
        self.status = status
        self.priority = priority
        self.deadline = deadline
        self.tags = tags
        self.links = links
    }
}

import Foundation

public struct ContactItem: EmpModel, Equatable, Sendable {
    public let id: UUID
    public let createdAt: Date
    public var updatedAt: Date
    public var isDeleted: Bool

    public var firstName: String
    public var lastName: String
    public var nickname: String?
    public var photo: Data?
    public var phone: String?
    public var email: String?
    public var notes: AttributedString?
    public var tags: [Tag]
    public var customFields: [ContactField]
    public var links: [EmpLink]
    public var sourceContactIdentifier: String?

    public init(
        id: UUID = UUID(),
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        isDeleted: Bool = false,
        firstName: String,
        lastName: String,
        nickname: String? = nil,
        photo: Data? = nil,
        phone: String? = nil,
        email: String? = nil,
        notes: AttributedString? = nil,
        tags: [Tag] = [],
        customFields: [ContactField] = [],
        links: [EmpLink] = [],
        sourceContactIdentifier: String? = nil
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isDeleted = isDeleted
        self.firstName = firstName
        self.lastName = lastName
        self.nickname = nickname
        self.photo = photo
        self.phone = phone
        self.email = email
        self.notes = notes
        self.tags = tags
        self.customFields = customFields
        self.links = links
        self.sourceContactIdentifier = sourceContactIdentifier
    }
}

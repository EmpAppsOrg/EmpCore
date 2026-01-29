import Foundation

public struct ContactField: Codable, Equatable, Hashable, Sendable {
    public let id: UUID
    public var label: String
    public var type: ContactFieldType
    public var value: String
    public var selectionOptions: [String]?
    public var sortOrder: Int

    public init(
        id: UUID = UUID(),
        label: String,
        type: ContactFieldType,
        value: String,
        selectionOptions: [String]? = nil,
        sortOrder: Int = 0
    ) {
        self.id = id
        self.label = label
        self.type = type
        self.value = value
        self.selectionOptions = selectionOptions
        self.sortOrder = sortOrder
    }
}

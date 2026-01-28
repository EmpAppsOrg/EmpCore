import Foundation

public protocol EmpModel: Identifiable, Codable, Sendable {
    var id: UUID { get }
    var createdAt: Date { get }
    var updatedAt: Date { get }
    var isDeleted: Bool { get }
}

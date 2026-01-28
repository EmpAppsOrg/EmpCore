import Foundation

public struct LinkRegistry: Codable, Sendable {
    public private(set) var deletedIDs: Set<UUID>

    public init(deletedIDs: Set<UUID> = []) {
        self.deletedIDs = deletedIDs
    }

    public mutating func markDeleted(_ id: UUID) {
        deletedIDs.insert(id)
    }

    public func isDeleted(_ id: UUID) -> Bool {
        deletedIDs.contains(id)
    }

    public func filterAlive(_ links: [EmpLink]) -> [EmpLink] {
        links.filter { !isDeleted($0.targetID) }
    }

    public mutating func removeFromDeleted(_ id: UUID) {
        deletedIDs.remove(id)
    }
}

import Foundation

public struct ImportResult: Sendable {
    public let created: Int
    public let updated: Int
    public let skipped: Int
    public let errors: [ImportError]

    public init(created: Int, updated: Int, skipped: Int, errors: [ImportError]) {
        self.created = created
        self.updated = updated
        self.skipped = skipped
        self.errors = errors
    }
}

public enum ImportError: Error, Sendable {
    case decodingFailed(String)
    case duplicateID(UUID)
    case invalidVersion(Int)
}

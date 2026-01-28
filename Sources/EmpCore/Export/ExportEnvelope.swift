import Foundation

public struct ExportEnvelope<T: EmpModel & Encodable & Decodable>: Codable {
    public let version: Int
    public let exportedAt: Date
    public let sourceApp: String
    public let entries: [T]

    public init(
        version: Int = 1,
        exportedAt: Date = Date(),
        sourceApp: String,
        entries: [T]
    ) {
        self.version = version
        self.exportedAt = exportedAt
        self.sourceApp = sourceApp
        self.entries = entries
    }
}

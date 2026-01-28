import Foundation

public struct EmpLink: Codable, Equatable, Hashable, Sendable {
    public let targetID: UUID
    public let targetAppID: String

    public init(targetID: UUID, targetAppID: String) {
        self.targetID = targetID
        self.targetAppID = targetAppID
    }
}

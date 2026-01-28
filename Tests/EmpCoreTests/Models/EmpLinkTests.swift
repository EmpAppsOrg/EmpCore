@testable import EmpCore
import Foundation
import Testing

@Suite("EmpLink Tests")
struct EmpLinkTests {
    @Test("EmpLink stores targetID and targetAppID")
    func creation() {
        let id = UUID()
        let link = EmpLink(targetID: id, targetAppID: "emp-tasks")

        #expect(link.targetID == id)
        #expect(link.targetAppID == "emp-tasks")
    }

    @Test("EmpLink encodes and decodes to JSON")
    func codable() throws {
        let link = EmpLink(targetID: UUID(), targetAppID: "emp-diary")
        let data = try JSONEncoder().encode(link)
        let decoded = try JSONDecoder().decode(EmpLink.self, from: data)

        #expect(decoded.targetID == link.targetID)
        #expect(decoded.targetAppID == link.targetAppID)
    }

    @Test("EmpLink supports Equatable")
    func equatable() {
        let id = UUID()
        let a = EmpLink(targetID: id, targetAppID: "emp-tasks")
        let b = EmpLink(targetID: id, targetAppID: "emp-tasks")

        #expect(a == b)
    }
}

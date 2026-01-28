@testable import EmpCore
import Foundation
import Testing

@Suite("LinkRegistry Tests")
struct LinkRegistryTests {
    @Test("Empty registry has no deleted IDs")
    func empty() {
        let registry = LinkRegistry()
        #expect(registry.deletedIDs.isEmpty)
    }

    @Test("Register deleted ID")
    func registerDeleted() {
        var registry = LinkRegistry()
        let id = UUID()
        registry.markDeleted(id)

        #expect(registry.isDeleted(id))
    }

    @Test("Non-deleted ID returns false")
    func notDeleted() {
        let registry = LinkRegistry()
        #expect(!registry.isDeleted(UUID()))
    }

    @Test("Filter dead links from array")
    func filterDeadLinks() {
        var registry = LinkRegistry()
        let deadID = UUID()
        let aliveID = UUID()
        registry.markDeleted(deadID)

        let links = [
            EmpLink(targetID: aliveID, targetAppID: "emp-tasks"),
            EmpLink(targetID: deadID, targetAppID: "emp-diary"),
        ]

        let alive = registry.filterAlive(links)
        #expect(alive.count == 1)
        #expect(alive[0].targetID == aliveID)
    }

    @Test("LinkRegistry encodes and decodes to JSON")
    func codable() throws {
        var registry = LinkRegistry()
        let id = UUID()
        registry.markDeleted(id)

        let data = try JSONEncoder().encode(registry)
        let decoded = try JSONDecoder().decode(LinkRegistry.self, from: data)

        #expect(decoded.isDeleted(id))
    }

    @Test("Cleanup removes specific IDs")
    func cleanup() {
        var registry = LinkRegistry()
        let id1 = UUID()
        let id2 = UUID()
        registry.markDeleted(id1)
        registry.markDeleted(id2)

        registry.removeFromDeleted(id1)

        #expect(!registry.isDeleted(id1))
        #expect(registry.isDeleted(id2))
    }
}

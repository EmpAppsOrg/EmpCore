@testable import EmpCore
import Foundation
import Testing

private typealias Tag = EmpCore.Tag

@Suite("Tag Tests")
struct TagTests {
    @Test("Tag conforms to EmpModel")
    func creation() {
        let now = Date()
        let tag = Tag(
            id: UUID(),
            createdAt: now,
            updatedAt: now,
            isDeleted: false,
            name: "work",
            color: "#FF0000"
        )

        #expect(tag.name == "work")
        #expect(tag.color == "#FF0000")
        #expect(tag.isDeleted == false)
    }

    @Test("Tag encodes and decodes to JSON")
    func codable() throws {
        let tag = Tag(
            id: UUID(),
            createdAt: Date(),
            updatedAt: Date(),
            isDeleted: false,
            name: "personal",
            color: "#00FF00"
        )

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(tag)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let decoded = try decoder.decode(Tag.self, from: data)

        #expect(decoded.id == tag.id)
        #expect(decoded.name == tag.name)
        #expect(decoded.color == tag.color)
    }

    @Test("Tag supports Equatable by id")
    func equatable() {
        let id = UUID()
        let now = Date()
        let a = Tag(id: id, createdAt: now, updatedAt: now, isDeleted: false, name: "a", color: "#000")
        let b = Tag(id: id, createdAt: now, updatedAt: now, isDeleted: false, name: "a", color: "#000")

        #expect(a == b)
    }

    @Test("Hierarchical tag computes depth and parentPath")
    func hierarchy() {
        let tag = Tag(name: "work.project.task", color: "#FF0000")

        #expect(tag.depth == 2)
        #expect(tag.parentPath == "work.project")
        #expect(tag.displayName == "task")
        #expect(tag.components == ["work", "project", "task"])
        #expect(!tag.isRoot)
    }

    @Test("Root tag has depth 0 and no parentPath")
    func rootTag() {
        let tag = Tag(name: "personal", color: "#00FF00")

        #expect(tag.depth == 0)
        #expect(tag.parentPath == nil)
        #expect(tag.displayName == "personal")
        #expect(tag.isRoot)
    }
}

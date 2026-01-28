@testable import EmpCore
import Foundation
import Testing

private typealias Tag = EmpCore.Tag

@Suite("DiaryEntry Tests")
struct DiaryEntryTests {
    @Test("DiaryEntry conforms to EmpModel")
    func creation() {
        let entry = DiaryEntry(
            title: "My day",
            body: AttributedString("Today was great"),
        )

        #expect(entry.title == "My day")
        #expect(String(entry.body.characters) == "Today was great")
        #expect(entry.tags.isEmpty)
        #expect(entry.links.isEmpty)
        #expect(entry.isDeleted == false)
    }

    @Test("DiaryEntry encodes and decodes to JSON")
    func codable() throws {
        let tag = Tag(name: "journal", color: "#0000FF")
        let link = EmpLink(targetID: UUID(), targetAppID: "emp-tasks")

        let entry = DiaryEntry(
            title: "Monday",
            body: AttributedString("Productive day"),
            tags: [tag],
            links: [link],
        )

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(entry)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let decoded = try decoder.decode(DiaryEntry.self, from: data)

        #expect(decoded.id == entry.id)
        #expect(decoded.title == entry.title)
        #expect(String(decoded.body.characters) == "Productive day")
        #expect(decoded.tags.count == 1)
        #expect(decoded.links.count == 1)
    }

    @Test("DiaryEntry with defaults")
    func defaults() {
        let entry = DiaryEntry(title: "Empty")

        #expect(String(entry.body.characters) == "")
        #expect(entry.tags.isEmpty)
        #expect(entry.links.isEmpty)
    }
}

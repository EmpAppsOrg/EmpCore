@testable import EmpCore
import Foundation
import Testing

@Suite("ContactFieldType Tests")
struct ContactFieldTypeTests {
    @Test("ContactFieldType has expected cases")
    func cases() {
        let allCases: [ContactFieldType] = [.text, .date, .number, .url, .selection]
        #expect(allCases.count == 5)
    }

    @Test("ContactFieldType raw values are strings")
    func rawValues() {
        #expect(ContactFieldType.text.rawValue == "text")
        #expect(ContactFieldType.date.rawValue == "date")
        #expect(ContactFieldType.number.rawValue == "number")
        #expect(ContactFieldType.url.rawValue == "url")
        #expect(ContactFieldType.selection.rawValue == "selection")
    }

    @Test("ContactFieldType encodes and decodes")
    func codable() throws {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let data = try encoder.encode(ContactFieldType.selection)
        let decoded = try decoder.decode(ContactFieldType.self, from: data)
        #expect(decoded == .selection)
    }
}

@Suite("ContactField Tests")
struct ContactFieldTests {
    @Test("ContactField creation with defaults")
    func creation() {
        let field = ContactField(label: "Birthday", type: .date, value: "2000-01-01")
        #expect(field.label == "Birthday")
        #expect(field.type == .date)
        #expect(field.value == "2000-01-01")
        #expect(field.selectionOptions == nil)
        #expect(field.sortOrder == 0)
    }

    @Test("ContactField creation with all parameters")
    func fullCreation() {
        let id = UUID()
        let field = ContactField(
            id: id,
            label: "Priority",
            type: .selection,
            value: "High",
            selectionOptions: ["Low", "Medium", "High"],
            sortOrder: 2
        )
        #expect(field.id == id)
        #expect(field.selectionOptions == ["Low", "Medium", "High"])
        #expect(field.sortOrder == 2)
    }

    @Test("ContactField encodes and decodes")
    func codable() throws {
        let field = ContactField(label: "Website", type: .url, value: "https://example.com")
        let encoder = JSONEncoder()
        let data = try encoder.encode(field)
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(ContactField.self, from: data)
        #expect(decoded == field)
    }

    @Test("ContactField supports Equatable")
    func equatable() {
        let id = UUID()
        let a = ContactField(id: id, label: "A", type: .text, value: "v")
        let b = ContactField(id: id, label: "A", type: .text, value: "v")
        #expect(a == b)
    }

    @Test("ContactField supports Hashable")
    func hashable() {
        let field = ContactField(label: "X", type: .text, value: "Y")
        var set: Set<ContactField> = []
        set.insert(field)
        #expect(set.contains(field))
    }
}

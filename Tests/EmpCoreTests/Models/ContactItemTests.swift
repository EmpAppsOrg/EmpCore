@testable import EmpCore
import Foundation
import Testing

@Suite("ContactItem Tests")
struct ContactItemTests {
    @Test("ContactItem creation with required fields only")
    func minimalCreation() {
        let contact = ContactItem(firstName: "John", lastName: "Doe")
        #expect(contact.firstName == "John")
        #expect(contact.lastName == "Doe")
        #expect(contact.nickname == nil)
        #expect(contact.photo == nil)
        #expect(contact.phone == nil)
        #expect(contact.email == nil)
        #expect(contact.notes == nil)
        #expect(contact.tags.isEmpty)
        #expect(contact.customFields.isEmpty)
        #expect(contact.links.isEmpty)
        #expect(contact.sourceContactIdentifier == nil)
        #expect(contact.isDeleted == false)
    }

    @Test("ContactItem creation with all parameters")
    func fullCreation() {
        let id = UUID()
        let now = Date()
        let tag = Tag(name: "friend", color: "#00F")
        let field = ContactField(label: "Age", type: .number, value: "30")
        let link = EmpLink(targetID: UUID(), targetAppID: "com.example")

        let contact = ContactItem(
            id: id,
            createdAt: now,
            updatedAt: now,
            isDeleted: false,
            firstName: "Jane",
            lastName: "Smith",
            nickname: "JS",
            photo: Data([0x00]),
            phone: "+1234567890",
            email: "jane@example.com",
            notes: AttributedString("Some notes"),
            tags: [tag],
            customFields: [field],
            links: [link],
            sourceContactIdentifier: "ABC-123"
        )

        #expect(contact.id == id)
        #expect(contact.firstName == "Jane")
        #expect(contact.nickname == "JS")
        #expect(contact.phone == "+1234567890")
        #expect(contact.email == "jane@example.com")
        #expect(contact.tags.count == 1)
        #expect(contact.customFields.count == 1)
        #expect(contact.links.count == 1)
        #expect(contact.sourceContactIdentifier == "ABC-123")
    }

    @Test("ContactItem conforms to EmpModel")
    func empModel() {
        let contact = ContactItem(firstName: "A", lastName: "B")
        // EmpModel requires id, createdAt, updatedAt, isDeleted
        let _: UUID = contact.id
        let _: Date = contact.createdAt
        let _: Date = contact.updatedAt
        let _: Bool = contact.isDeleted
    }

    @Test("ContactItem encodes and decodes")
    func codable() throws {
        let contact = ContactItem(
            firstName: "John",
            lastName: "Doe",
            phone: "+1234567890",
            email: "john@example.com",
            tags: [Tag(name: "work", color: "#F00")],
            customFields: [ContactField(label: "Title", type: .text, value: "Engineer")]
        )

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(contact)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let decoded = try decoder.decode(ContactItem.self, from: data)

        #expect(decoded.id == contact.id)
        #expect(decoded.firstName == contact.firstName)
        #expect(decoded.lastName == contact.lastName)
        #expect(decoded.phone == contact.phone)
        #expect(decoded.email == contact.email)
        #expect(decoded.tags.count == 1)
        #expect(decoded.customFields.count == 1)
    }

    @Test("ContactItem supports Equatable")
    func equatable() {
        let id = UUID()
        let now = Date()
        let a = ContactItem(id: id, createdAt: now, updatedAt: now, firstName: "A", lastName: "B")
        let b = ContactItem(id: id, createdAt: now, updatedAt: now, firstName: "A", lastName: "B")
        #expect(a == b)
    }
}

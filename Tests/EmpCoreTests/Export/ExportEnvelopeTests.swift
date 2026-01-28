@testable import EmpCore
import Foundation
import Testing

@Suite("ExportEnvelope Tests")
struct ExportEnvelopeTests {
    @Test("Envelope encodes with version and metadata")
    func encode() throws {
        let task = TaskItem(title: "Test task")
        let envelope = ExportEnvelope(
            sourceApp: "emp-tasks",
            entries: [task]
        )

        #expect(envelope.version == 1)
        #expect(envelope.sourceApp == "emp-tasks")
        #expect(envelope.entries.count == 1)

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(envelope)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let decoded = try decoder.decode(ExportEnvelope<TaskItem>.self, from: data)

        #expect(decoded.version == 1)
        #expect(decoded.sourceApp == "emp-tasks")
        #expect(decoded.entries.count == 1)
        #expect(decoded.entries[0].title == "Test task")
    }

    @Test("Envelope with DiaryEntry")
    func diaryExport() throws {
        let entry = DiaryEntry(title: "Monday", body: AttributedString("Good day"))
        let envelope = ExportEnvelope(
            sourceApp: "emp-diary",
            entries: [entry]
        )

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(envelope)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let decoded = try decoder.decode(ExportEnvelope<DiaryEntry>.self, from: data)

        #expect(decoded.sourceApp == "emp-diary")
        #expect(decoded.entries[0].title == "Monday")
    }

    @Test("ImportResult tracks counts")
    func importResult() {
        let result = ImportResult(created: 5, updated: 2, skipped: 1, errors: [])

        #expect(result.created == 5)
        #expect(result.updated == 2)
        #expect(result.skipped == 1)
        #expect(result.errors.isEmpty)
    }
}

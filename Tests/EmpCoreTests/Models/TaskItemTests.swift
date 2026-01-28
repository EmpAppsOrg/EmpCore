@testable import EmpCore
import Foundation
import Testing

private typealias Tag = EmpCore.Tag

@Suite("TaskItem Tests")
struct TaskItemTests {
    @Test("TaskItem conforms to EmpModel")
    func creation() {
        let task = TaskItem(
            title: "Buy milk",
            body: "From the store",
            status: .todo,
            priority: .medium
        )

        #expect(task.title == "Buy milk")
        #expect(task.body == "From the store")
        #expect(task.status == .todo)
        #expect(task.priority == .medium)
        #expect(task.deadline == nil)
        #expect(task.tags.isEmpty)
        #expect(task.links.isEmpty)
        #expect(task.isDeleted == false)
    }

    @Test("TaskItem encodes and decodes to JSON")
    func codable() throws {
        let tag = Tag(name: "errand", color: "#FF0000")
        let link = EmpLink(targetID: UUID(), targetAppID: "emp-diary")

        let task = TaskItem(
            title: "Buy milk",
            body: "2% milk",
            status: .inProgress,
            priority: .high,
            deadline: Date(),
            tags: [tag],
            links: [link]
        )

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(task)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let decoded = try decoder.decode(TaskItem.self, from: data)

        #expect(decoded.id == task.id)
        #expect(decoded.title == task.title)
        #expect(decoded.body == task.body)
        #expect(decoded.status == task.status)
        #expect(decoded.priority == task.priority)
        #expect(decoded.tags.count == 1)
        #expect(decoded.links.count == 1)
    }

    @Test("TaskItem with all defaults")
    func defaults() {
        let task = TaskItem(title: "Quick task")

        #expect(task.body.isEmpty)
        #expect(task.status == .todo)
        #expect(task.priority == .medium)
        #expect(task.deadline == nil)
    }
}

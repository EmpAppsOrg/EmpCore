@testable import EmpCore
import Foundation
import Testing

@Suite("Task Enums Tests")
struct TaskEnumsTests {
    @Test("TaskStatus has correct cases")
    func statusCases() {
        let cases: [TaskStatus] = [.todo, .inProgress, .done]
        #expect(cases.count == 3)
    }

    @Test("TaskStatus encodes and decodes")
    func statusCodable() throws {
        let status = TaskStatus.inProgress
        let data = try JSONEncoder().encode(status)
        let decoded = try JSONDecoder().decode(TaskStatus.self, from: data)
        #expect(decoded == status)
    }

    @Test("TaskPriority has correct cases")
    func priorityCases() {
        let cases: [TaskPriority] = [.low, .medium, .high]
        #expect(cases.count == 3)
    }

    @Test("TaskPriority is comparable: high > medium > low")
    func priorityComparable() {
        #expect(TaskPriority.high > TaskPriority.medium)
        #expect(TaskPriority.medium > TaskPriority.low)
    }
}

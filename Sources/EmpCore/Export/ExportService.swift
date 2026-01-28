import Foundation

public protocol ExportService: Sendable {
    associatedtype Model: EmpModel

    func exportAll() async throws -> Data
    func exportFiltered(from: Date?, to: Date?, tags: [Tag]?) async throws -> Data
    func importData(_ data: Data) async throws -> ImportResult
}

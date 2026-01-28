import Foundation

public protocol AppDiscovery: Sendable {
    func installedApps() -> [EmpApp]
    func canOpen(_ app: EmpApp) -> Bool
    func open(_ app: EmpApp, action: AppAction) async -> Bool
}

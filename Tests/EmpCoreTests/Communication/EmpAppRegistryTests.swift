@testable import EmpCore
import Foundation
import Testing

@Suite("EmpAppRegistry Tests")
struct EmpAppRegistryTests {
    @Test("Registry contains all known apps")
    func allApps() {
        let apps = EmpAppRegistry.allApps
        let ids = apps.map(\.id)

        #expect(ids.contains("emp-diary"))
        #expect(ids.contains("emp-tasks"))
    }

    @Test("Each app has a URL scheme")
    func schemes() {
        for app in EmpAppRegistry.allApps {
            #expect(!app.scheme.isEmpty)
        }
    }

    @Test("Each app has at least one action")
    func actions() {
        for app in EmpAppRegistry.allApps {
            #expect(!app.actions.isEmpty)
        }
    }

    @Test("Find app by ID")
    func findByID() {
        let app = EmpAppRegistry.app(withID: "emp-tasks")
        #expect(app != nil)
        #expect(app?.displayName == "Tasks")
    }

    @Test("Unknown app ID returns nil")
    func unknownApp() {
        let app = EmpAppRegistry.app(withID: "unknown")
        #expect(app == nil)
    }
}

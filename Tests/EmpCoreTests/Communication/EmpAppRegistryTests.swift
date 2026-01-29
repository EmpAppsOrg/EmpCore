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
        #expect(ids.contains("emp-contacts"))
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

    @Test("Find contacts app by ID")
    func findContacts() {
        let app = EmpAppRegistry.app(withID: "emp-contacts")
        #expect(app != nil)
        #expect(app?.scheme == "emp-contacts")
        #expect(app?.displayName == "Contacts")
        #expect(app?.actions.count == 2)
    }

    @Test("Unknown app ID returns nil")
    func unknownApp() {
        let app = EmpAppRegistry.app(withID: "unknown")
        #expect(app == nil)
    }
}

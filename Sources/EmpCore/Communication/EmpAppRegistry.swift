import Foundation

public enum EmpAppRegistry {
    public static let allApps: [EmpApp] = [
        EmpApp(
            id: "emp-diary",
            scheme: "emp-diary",
            displayName: "Diary",
            actions: [
                AppAction(type: .create, label: "New Entry", icon: "book"),
                AppAction(type: .open, label: "Open Entry", icon: "book.fill")
            ]
        ),
        EmpApp(
            id: "emp-tasks",
            scheme: "emp-tasks",
            displayName: "Tasks",
            actions: [
                AppAction(type: .create, label: "New Task", icon: "checklist"),
                AppAction(type: .open, label: "Open Task", icon: "checklist.checked")
            ]
        ),
        EmpApp(
            id: "emp-contacts",
            scheme: "emp-contacts",
            displayName: "Contacts",
            actions: [
                AppAction(type: .create, label: "New Contact", icon: "person.badge.plus"),
                AppAction(type: .open, label: "Open Contact", icon: "person.fill")
            ]
        )
    ]

    public static func app(withID id: String) -> EmpApp? {
        allApps.first { $0.id == id }
    }
}

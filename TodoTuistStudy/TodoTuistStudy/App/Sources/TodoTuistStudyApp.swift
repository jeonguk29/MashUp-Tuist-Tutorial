import SwiftUI

@main
struct TodoTuistStudyApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
        }
    }
}

enum Route: Hashable {
    case detail(UUID)
    case createTodo
    case editTodo(UUID)
}

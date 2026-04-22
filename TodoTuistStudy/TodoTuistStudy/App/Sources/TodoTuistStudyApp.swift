import SwiftUI

@main
struct TodoTuistStudyApp: App {
    @State private var container = AppDIContainer()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(container: container)
        }
    }
}

enum Route: Hashable {
    case detail(UUID)
    case createTodo
    case editTodo(UUID)
}

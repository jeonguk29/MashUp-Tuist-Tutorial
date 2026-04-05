import SwiftUI
import Domain

@main
struct TodoTuistStudyApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = InMemoryTodoRepository(
                initialTodos: [
                    Todo(title: "Tuist 프로젝트 구조 이해하기", isDone: false),
                    Todo(title: "Domain 타깃 분리하기", isDone: true)
                ]
            )

            let viewModel = TodoListViewModel(
                fetchTodosUseCase: FetchTodosUseCase(repository: repository),
                addTodoUseCase: AddTodoUseCase(repository: repository),
                toggleTodoUseCase: ToggleTodoUseCase(repository: repository),
                deleteTodoUseCase: DeleteTodoUseCase(repository: repository)
            )

            ContentView(viewModel: viewModel)
        }
    }
}

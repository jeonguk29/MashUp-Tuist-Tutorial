import SwiftUI

@main
struct TodoTuistStudyApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = InMemoryTodoRepository(
                initialTodos: [
                    Todo(title: "Tuist 프로젝트 구조 이해하기", isDone: false),
                    Todo(title: "최소 TODO 앱 만들기", isDone: true)
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

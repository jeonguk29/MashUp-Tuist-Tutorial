import SwiftUI
import Domain
import Data

@main
struct TodoTuistStudyApp: App {
    var body: some Scene {
        WindowGroup {
 
            let dataSource = DefaultTodoLocalDataSource(
                initialTodos: [
                    TodoDTO(id: UUID(), title: "Tuist 구조 익히기", isDone: false),
                    TodoDTO(id: UUID(), title: "Domain 분리하기", isDone: true)
                ]
            )

            let repository = InMemoryTodoRepository(dataSource: dataSource)

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

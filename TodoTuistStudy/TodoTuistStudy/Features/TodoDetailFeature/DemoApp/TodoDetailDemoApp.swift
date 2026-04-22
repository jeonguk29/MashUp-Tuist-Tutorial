import SwiftUI
import TodoDetailFeature
import Domain
import Repository
import CacheData
import NetworkData

@main
struct TodoDetailDemoApp: App {
    @State private var container = TodoDetailDemoContainer()

    var body: some Scene {
        WindowGroup {
            if let todoID = container.firstTodoID {
                TodoDetailView(
                    viewModel: container.makeViewModel(todoID: todoID),
                    onEditTodo: { _ in },
                    onDeleted: { }
                )
            } else {
                Text("데이터가 없습니다")
            }
        }
    }
}

@MainActor
private final class TodoDetailDemoContainer {
    private let repository: TodoRepository

    let fetchTodosUseCase: FetchTodosUseCase
    let toggleTodoUseCase: ToggleTodoUseCase
    let deleteTodoUseCase: DeleteTodoUseCase

    var firstTodoID: UUID? {
        fetchTodosUseCase.execute().first?.id
    }

    init() {
        let cacheSource: any CachedTodoDataSource = InMemoryCachedTodoDataSource()
        let networkSource: any NetworkTodoDataSource = InMemoryNetworkTodoDataSource()
        let repo: TodoRepository = CompositeTodoRepository(
            cache: cacheSource,
            network: networkSource
        )
        self.repository = repo
        self.fetchTodosUseCase = FetchTodosUseCase(repository: repo)
        self.toggleTodoUseCase = ToggleTodoUseCase(repository: repo)
        self.deleteTodoUseCase = DeleteTodoUseCase(repository: repo)
    }

    func makeViewModel(todoID: UUID) -> TodoDetailViewModel {
        TodoDetailViewModel(
            todoID: todoID,
            fetchTodosUseCase: fetchTodosUseCase,
            toggleTodoUseCase: toggleTodoUseCase,
            deleteTodoUseCase: deleteTodoUseCase
        )
    }
}

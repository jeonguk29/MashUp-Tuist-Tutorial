import SwiftUI
import TodoListFeature
import Domain
import Repository
import CacheData
import NetworkData

@main
struct TodoListDemoApp: App {
    @State private var container = TodoListDemoContainer()

    var body: some Scene {
        WindowGroup {
            TodoListView(
                viewModel: container.makeViewModel(),
                onSelectTodo: { _ in },
                onCreateTodo: { }
            )
        }
    }
}

@MainActor
private final class TodoListDemoContainer {
    private let repository: TodoRepository

    let fetchTodosUseCase: FetchTodosUseCase
    let toggleTodoUseCase: ToggleTodoUseCase
    let deleteTodoUseCase: DeleteTodoUseCase

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

    func makeViewModel() -> TodoListViewModel {
        TodoListViewModel(
            fetchTodosUseCase: fetchTodosUseCase,
            toggleTodoUseCase: toggleTodoUseCase,
            deleteTodoUseCase: deleteTodoUseCase
        )
    }
}

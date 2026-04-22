import Foundation
import Domain

@MainActor
public final class TodoListViewModel: ObservableObject {
    @Published public private(set) var state = TodoListState()

    private let fetchTodosUseCase: FetchTodosUseCase
    private let toggleTodoUseCase: ToggleTodoUseCase
    private let deleteTodoUseCase: DeleteTodoUseCase

    public init(
        fetchTodosUseCase: FetchTodosUseCase,
        toggleTodoUseCase: ToggleTodoUseCase,
        deleteTodoUseCase: DeleteTodoUseCase
    ) {
        self.fetchTodosUseCase = fetchTodosUseCase
        self.toggleTodoUseCase = toggleTodoUseCase
        self.deleteTodoUseCase = deleteTodoUseCase

        loadTodos()
    }

    public func loadTodos() {
        state.todos = fetchTodosUseCase.execute()
    }

    public func toggleTodo(id: UUID) {
        toggleTodoUseCase.execute(id: id)
        loadTodos()
    }

    public func deleteTodo(at offsets: IndexSet) {
        let ids = offsets.map { state.todos[$0].id }
        deleteTodoUseCase.execute(ids: ids)
        loadTodos()
    }
}

import Foundation
import Domain

@MainActor
public final class TodoDetailViewModel: ObservableObject {
    @Published public private(set) var state = TodoDetailState()

    private let todoID: UUID
    private let fetchTodosUseCase: FetchTodosUseCase
    private let toggleTodoUseCase: ToggleTodoUseCase
    private let deleteTodoUseCase: DeleteTodoUseCase

    public init(
        todoID: UUID,
        fetchTodosUseCase: FetchTodosUseCase,
        toggleTodoUseCase: ToggleTodoUseCase,
        deleteTodoUseCase: DeleteTodoUseCase
    ) {
        self.todoID = todoID
        self.fetchTodosUseCase = fetchTodosUseCase
        self.toggleTodoUseCase = toggleTodoUseCase
        self.deleteTodoUseCase = deleteTodoUseCase

        loadTodo()
    }

    public func loadTodo() {
        state.todo = fetchTodosUseCase.execute().first(where: { $0.id == todoID })
    }

    public func toggleTodo() {
        toggleTodoUseCase.execute(id: todoID)
        loadTodo()
    }

    public func deleteTodo() {
        deleteTodoUseCase.execute(ids: [todoID])
        state.todo = nil
    }
}

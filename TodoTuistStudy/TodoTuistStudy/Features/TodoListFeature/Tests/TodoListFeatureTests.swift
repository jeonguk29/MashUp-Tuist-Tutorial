import Foundation
import XCTest
import Domain
@testable import TodoListFeature

@MainActor
final class TodoListFeatureTests: XCTestCase {
    func testLoadTodosReflectsRepositoryState() {
        let repository = TodoRepositorySpy(todos: [
            Todo(title: "A", isDone: false),
            Todo(title: "B", isDone: true)
        ])
        let viewModel = TodoListViewModel(
            fetchTodosUseCase: FetchTodosUseCase(repository: repository),
            toggleTodoUseCase: ToggleTodoUseCase(repository: repository),
            deleteTodoUseCase: DeleteTodoUseCase(repository: repository)
        )

        XCTAssertEqual(viewModel.state.todos.count, 2)
    }
}

private final class TodoRepositorySpy: TodoRepository {
    var todos: [Todo]

    init(todos: [Todo]) {
        self.todos = todos
    }

    func fetchTodos() -> [Todo] {
        todos
    }

    func addTodo(title: String) {}

    func updateTodo(id: UUID, title: String) {}

    func toggleTodo(id: UUID) {}

    func deleteTodos(ids: [UUID]) {}
}

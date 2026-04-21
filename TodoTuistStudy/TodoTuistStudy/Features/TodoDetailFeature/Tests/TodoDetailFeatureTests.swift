import Foundation
import XCTest
import Domain
@testable import TodoDetailFeature

@MainActor
final class TodoDetailFeatureTests: XCTestCase {
    func testLoadTodoFindsMatchingID() {
        let expectedTodo = Todo(title: "상세 화면", isDone: false)
        let repository = TodoRepositorySpy(todos: [expectedTodo])
        let viewModel = TodoDetailViewModel(
            todoID: expectedTodo.id,
            fetchTodosUseCase: FetchTodosUseCase(repository: repository),
            toggleTodoUseCase: ToggleTodoUseCase(repository: repository),
            deleteTodoUseCase: DeleteTodoUseCase(repository: repository)
        )

        XCTAssertEqual(viewModel.state.todo, expectedTodo)
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

import Foundation
import XCTest
import Domain
@testable import TodoEditFeature

@MainActor
final class TodoEditFeatureTests: XCTestCase {
    func testSaveInCreateModeAddsTodo() {
        let repository = TodoRepositorySpy()
        let viewModel = TodoEditViewModel(
            mode: .create,
            addTodoUseCase: AddTodoUseCase(repository: repository),
            updateTodoUseCase: UpdateTodoUseCase(repository: repository)
        )

        viewModel.updateTitle("새 할 일")

        XCTAssertTrue(viewModel.save())
        XCTAssertEqual(repository.addedTitle, "새 할 일")
    }
}

private final class TodoRepositorySpy: TodoRepository {
    private(set) var addedTitle: String?

    func fetchTodos() -> [Todo] {
        []
    }

    func addTodo(title: String) {
        addedTitle = title
    }

    func updateTodo(id: UUID, title: String) {}

    func toggleTodo(id: UUID) {}

    func deleteTodos(ids: [UUID]) {}
}

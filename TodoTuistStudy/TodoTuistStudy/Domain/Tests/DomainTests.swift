import Foundation
import XCTest
import DataInterface
@testable import Domain

final class DomainTests: XCTestCase {
    func testUpdateTodoUseCaseRejectsBlankTitle() {
        let repository = TodoRepositorySpy()
        let useCase = UpdateTodoUseCase(repository: repository)

        let didUpdate = useCase.execute(id: UUID(), title: "   ")

        XCTAssertFalse(didUpdate)
        XCTAssertNil(repository.updatedTitle)
    }
}

private final class TodoRepositorySpy: TodoRepository {
    private(set) var updatedTitle: String?

    func fetchTodos() -> [Todo] {
        []
    }

    func addTodo(title: String) {}

    func updateTodo(id: UUID, title: String) {
        updatedTitle = title
    }

    func toggleTodo(id: UUID) {}

    func deleteTodos(ids: [UUID]) {}
}

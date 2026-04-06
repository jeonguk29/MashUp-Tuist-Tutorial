import Foundation
import XCTest
@testable import Data

final class DataTests: XCTestCase {
    func testRepositoryUpdatesTodoTitle() {
        let todoID = UUID()
        let dataSource = DefaultTodoLocalDataSource(
            initialTodos: [TodoDTO(id: todoID, title: "이전 제목", isDone: false)]
        )
        let repository = InMemoryTodoRepository(dataSource: dataSource)

        repository.updateTodo(id: todoID, title: "새 제목")

        let todo = repository.fetchTodos().first
        XCTAssertEqual(todo?.title, "새 제목")
    }
}

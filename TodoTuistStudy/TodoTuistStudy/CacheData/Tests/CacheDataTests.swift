import XCTest
@testable import CacheData

final class CacheDataTests: XCTestCase {
    func testCachedRepositoryUpdatesTodoTitle() {
        let todoID = UUID()
        let repository = CachedTodoRepository(
            defaultTodos: [CachedTodoDTO(id: todoID, title: "이전 제목", isDone: false)]
        )

        repository.updateTodo(id: todoID, title: "새 제목")

        XCTAssertEqual(repository.fetchTodos().first?.title, "새 제목")
    }
}

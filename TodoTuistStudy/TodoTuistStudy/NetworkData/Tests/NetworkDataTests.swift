import XCTest
@testable import NetworkData

final class NetworkDataTests: XCTestCase {
    func testNetworkRepositoryReturnsDummyTodos() {
        let repository = NetworkTodoRepository()

        let todos = repository.fetchTodos()

        XCTAssertEqual(todos.count, 3)
        XCTAssertEqual(todos.first?.title, "서버에서 내려온 최신 할 일")
    }
}

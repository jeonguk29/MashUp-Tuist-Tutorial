import XCTest
import Domain
@testable import Repository

final class RepositoryTests: XCTestCase {
    func testFetchTodosReturnsCachedWhenAvailable() {
        let cache = StubCachedDataSource(
            entries: [CachedTodoDTO(title: "cache-only", isDone: false)]
        )
        let network = StubNetworkDataSource(entries: [])
        let repository = CompositeTodoRepository(cache: cache, network: network)

        let todos = repository.fetchTodos()

        XCTAssertEqual(todos.map(\.title), ["cache-only"])
        XCTAssertEqual(cache.insertedTitles, [])
    }

    func testFetchTodosFallsBackToNetworkAndWritesThroughCache() {
        let cache = StubCachedDataSource(entries: [])
        let network = StubNetworkDataSource(
            entries: [NetworkTodoDTO(title: "from-network", isDone: false)]
        )
        let repository = CompositeTodoRepository(cache: cache, network: network)

        let todos = repository.fetchTodos()

        XCTAssertEqual(todos.map(\.title), ["from-network"])
        XCTAssertEqual(cache.insertedTitles, ["from-network"])
    }
}

private final class StubCachedDataSource: CachedTodoDataSource {
    private var entries: [CachedTodoDTO]
    private(set) var insertedTitles: [String] = []

    init(entries: [CachedTodoDTO]) {
        self.entries = entries
    }

    func readAll() -> [CachedTodoDTO] { entries }

    func insert(title: String) {
        insertedTitles.append(title)
        entries.append(CachedTodoDTO(title: title, isDone: false))
    }

    func update(id: UUID, title: String) {}
    func toggle(id: UUID) {}
    func deleteMany(ids: [UUID]) {}
}

private final class StubNetworkDataSource: NetworkTodoDataSource {
    private let entries: [NetworkTodoDTO]

    init(entries: [NetworkTodoDTO]) {
        self.entries = entries
    }

    func readAll() -> [NetworkTodoDTO] { entries }
    func insert(title: String) {}
    func update(id: UUID, title: String) {}
    func toggle(id: UUID) {}
    func deleteMany(ids: [UUID]) {}
}

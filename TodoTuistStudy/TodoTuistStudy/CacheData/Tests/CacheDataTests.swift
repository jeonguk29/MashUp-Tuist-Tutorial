import XCTest
import Repository
@testable import CacheData

final class CacheDataTests: XCTestCase {
    func testCachedDataSourceUpdatesEntryTitle() {
        let id = UUID()
        let dataSource = InMemoryCachedTodoDataSource(
            defaultEntries: [CachedTodoDTO(id: id, title: "이전 제목", isDone: false)]
        )

        dataSource.update(id: id, title: "새 제목")

        XCTAssertEqual(dataSource.readAll().first?.title, "새 제목")
    }
}

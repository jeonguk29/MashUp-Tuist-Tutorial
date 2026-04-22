import XCTest
import Repository
@testable import NetworkData

final class NetworkDataTests: XCTestCase {
    func testNetworkDataSourceReturnsDummyEntries() {
        let dataSource = InMemoryNetworkTodoDataSource()

        let entries = dataSource.readAll()

        XCTAssertEqual(entries.count, 3)
        XCTAssertEqual(entries.first?.title, "서버에서 내려온 최신 할 일")
    }
}

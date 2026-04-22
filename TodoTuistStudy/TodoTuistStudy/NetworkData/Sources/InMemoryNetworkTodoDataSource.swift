import Foundation
import Repository

public final class InMemoryNetworkTodoDataSource: NetworkTodoDataSource {
    private var entries: [NetworkTodoDTO]

    public init() {
        self.entries = Self.defaultEntries
    }

    init(defaultEntries: [NetworkTodoDTO]) {
        self.entries = defaultEntries
    }

    public func readAll() -> [NetworkTodoDTO] {
        entries
    }

    public func insert(title: String) {
        entries.append(NetworkTodoDTO(title: title, isDone: false))
    }

    public func update(id: UUID, title: String) {
        guard let index = entries.firstIndex(where: { $0.id == id }) else { return }
        entries[index].title = title
    }

    public func toggle(id: UUID) {
        guard let index = entries.firstIndex(where: { $0.id == id }) else { return }
        entries[index].isDone.toggle()
    }

    public func deleteMany(ids: [UUID]) {
        entries.removeAll { ids.contains($0.id) }
    }
}

extension InMemoryNetworkTodoDataSource {
    static var defaultEntries: [NetworkTodoDTO] {
        [
            NetworkTodoDTO(title: "서버에서 내려온 최신 할 일", isDone: false),
            NetworkTodoDTO(title: "Network 응답으로 목록 갱신하기", isDone: false),
            NetworkTodoDTO(title: "gRPC 도입을 가정한 원격 데이터", isDone: true)
        ]
    }
}

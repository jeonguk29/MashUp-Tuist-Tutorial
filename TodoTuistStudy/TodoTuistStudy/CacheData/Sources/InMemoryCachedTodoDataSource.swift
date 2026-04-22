import Foundation
import Repository

public final class InMemoryCachedTodoDataSource: CachedTodoDataSource {
    private var entries: [CachedTodoDTO]

    public init() {
        self.entries = Self.defaultEntries
    }

    init(defaultEntries: [CachedTodoDTO]) {
        self.entries = defaultEntries
    }

    public func readAll() -> [CachedTodoDTO] {
        entries
    }

    public func insert(title: String) {
        entries.append(CachedTodoDTO(title: title, isDone: false))
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

extension InMemoryCachedTodoDataSource {
    static var defaultEntries: [CachedTodoDTO] {
        [
            CachedTodoDTO(title: "기기 캐시에서 불러온 할 일", isDone: false),
            CachedTodoDTO(title: "오프라인에서도 바로 보여주기", isDone: true),
            CachedTodoDTO(title: "캐시된 최근 응답으로 첫 화면 구성", isDone: false)
        ]
    }
}

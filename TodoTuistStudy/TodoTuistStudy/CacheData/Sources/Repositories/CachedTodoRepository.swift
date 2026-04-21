import Foundation
import DataInterface

public final class CachedTodoRepository: CachedTodoRepositorySpec {
    private var todos: [CachedTodoDTO]

    public init() {
        // 실제 구현이라면 Core Data, Realm, SQLite 같은 로컬 캐시 저장소를 사용한다.
        self.todos = Self.defaultTodos
    }

    init(defaultTodos: [CachedTodoDTO]) {
        self.todos = defaultTodos
    }

    public func fetchTodos() -> [Todo] {
        todos.map { $0.toDomain() }
    }

    public func addTodo(title: String) {
        todos.append(CachedTodoDTO(title: title, isDone: false))
    }

    public func updateTodo(id: UUID, title: String) {
        guard let index = todos.firstIndex(where: { $0.id == id }) else { return }
        todos[index].title = title
    }

    public func toggleTodo(id: UUID) {
        guard let index = todos.firstIndex(where: { $0.id == id }) else { return }
        todos[index].isDone.toggle()
    }

    public func deleteTodos(ids: [UUID]) {
        todos.removeAll { ids.contains($0.id) }
    }
}

extension CachedTodoRepository {
    static var defaultTodos: [CachedTodoDTO] {
        [
        CachedTodoDTO(title: "기기 캐시에서 불러온 할 일", isDone: false),
        CachedTodoDTO(title: "오프라인에서도 바로 보여주기", isDone: true),
        CachedTodoDTO(title: "캐시된 최근 응답으로 첫 화면 구성", isDone: false)
        ]
    }
}

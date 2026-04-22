import Foundation
import Domain

public final class CompositeTodoRepository: TodoRepository {
    private let cache: any CachedTodoDataSource
    private let network: any NetworkTodoDataSource

    public init(
        cache: any CachedTodoDataSource,
        network: any NetworkTodoDataSource
    ) {
        self.cache = cache
        self.network = network
    }

    public func fetchTodos() -> [Todo] {
        let cached = cache.readAll()
        if cached.isEmpty == false {
            return cached.map(Self.makeTodo(from:))
        }
        let fromNetwork = network.readAll()
        fromNetwork.forEach { cache.insert(title: $0.title) }
        return fromNetwork.map(Self.makeTodo(from:))
    }

    public func addTodo(title: String) {
        cache.insert(title: title)
    }

    public func updateTodo(id: UUID, title: String) {
        cache.update(id: id, title: title)
    }

    public func toggleTodo(id: UUID) {
        cache.toggle(id: id)
    }

    public func deleteTodos(ids: [UUID]) {
        cache.deleteMany(ids: ids)
    }

    private static func makeTodo(from dto: CachedTodoDTO) -> Todo {
        Todo(id: dto.id, title: dto.title, isDone: dto.isDone)
    }

    private static func makeTodo(from dto: NetworkTodoDTO) -> Todo {
        Todo(id: dto.id, title: dto.title, isDone: dto.isDone)
    }
}

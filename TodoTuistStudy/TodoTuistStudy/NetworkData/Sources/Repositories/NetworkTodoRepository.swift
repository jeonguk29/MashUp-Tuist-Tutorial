import Foundation
import DataInterface

public final class NetworkTodoRepository: NetworkTodoRepositorySpec {
    private var todos: [NetworkTodoDTO]

    public init() {
        // 실제 구현이라면 Alamofire, URLSession, gRPC client 같은 네트워크 계층으로 서버를 호출한다.
        self.todos = Self.defaultTodos
    }

    init(defaultTodos: [NetworkTodoDTO]) {
        self.todos = defaultTodos
    }

    public func fetchTodos() -> [Todo] {
        todos.map { $0.toDomain() }
    }

    public func addTodo(title: String) {
        todos.append(NetworkTodoDTO(title: title, isDone: false))
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

extension NetworkTodoRepository {
    static var defaultTodos: [NetworkTodoDTO] {
        [
        NetworkTodoDTO(title: "서버에서 내려온 최신 할 일", isDone: false),
        NetworkTodoDTO(title: "Network 응답으로 목록 갱신하기", isDone: false),
        NetworkTodoDTO(title: "gRPC 도입을 가정한 원격 데이터", isDone: true)
        ]
    }
}

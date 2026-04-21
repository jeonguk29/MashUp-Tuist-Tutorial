import Foundation

public protocol TodoRepository {
    func fetchTodos() -> [Todo]
    func addTodo(title: String)
    func updateTodo(id: UUID, title: String)
    func toggleTodo(id: UUID)
    func deleteTodos(ids: [UUID])
}

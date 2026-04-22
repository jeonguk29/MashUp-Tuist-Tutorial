import Foundation

public protocol NetworkTodoDataSource {
    func readAll() -> [NetworkTodoDTO]
    func insert(title: String)
    func update(id: UUID, title: String)
    func toggle(id: UUID)
    func deleteMany(ids: [UUID])
}

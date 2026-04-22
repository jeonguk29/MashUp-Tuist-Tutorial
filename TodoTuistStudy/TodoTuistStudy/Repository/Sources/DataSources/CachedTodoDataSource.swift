import Foundation

public protocol CachedTodoDataSource {
    func readAll() -> [CachedTodoDTO]
    func insert(title: String)
    func update(id: UUID, title: String)
    func toggle(id: UUID)
    func deleteMany(ids: [UUID])
}

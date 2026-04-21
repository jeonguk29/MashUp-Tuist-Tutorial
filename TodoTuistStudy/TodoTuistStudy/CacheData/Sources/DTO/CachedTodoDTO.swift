import Foundation
import DataInterface

struct CachedTodoDTO {
    let id: UUID
    var title: String
    var isDone: Bool

    init(id: UUID = UUID(), title: String, isDone: Bool) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }

    func toDomain() -> Todo {
        Todo(id: id, title: title, isDone: isDone)
    }
}

extension Todo {
    init(dto: CachedTodoDTO) {
        self.init(id: dto.id, title: dto.title, isDone: dto.isDone)
    }
}

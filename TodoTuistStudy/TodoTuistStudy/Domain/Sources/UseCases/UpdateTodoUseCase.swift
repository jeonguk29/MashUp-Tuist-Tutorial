import Foundation

public struct UpdateTodoUseCase {
    private let repository: TodoRepository

    public init(repository: TodoRepository) {
        self.repository = repository
    }

    public func execute(id: UUID, title: String) -> Bool {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmedTitle.isEmpty == false else { return false }

        repository.updateTodo(id: id, title: trimmedTitle)
        return true
    }
}

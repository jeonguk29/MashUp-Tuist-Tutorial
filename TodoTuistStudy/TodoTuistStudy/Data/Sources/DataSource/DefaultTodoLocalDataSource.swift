//
//  DefaultTodoLocalDataSource.swift
//  Domain
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation

public final class DefaultTodoLocalDataSource: TodoLocalDataSource {
    private var todos: [TodoDTO]

    public init(initialTodos: [TodoDTO] = []) {
        self.todos = initialTodos
    }

    public func fetchTodos() -> [TodoDTO] {
        todos
    }

    public func addTodo(title: String) {
        let newTodo = TodoDTO(
            id: UUID(),
            title: title,
            isDone: false
        )
        todos.append(newTodo)
    }

    public func updateTodo(id: UUID, title: String) {
        guard let index = todos.firstIndex(where: { $0.id == id }) else { return }
        todos[index] = TodoDTO(
            id: todos[index].id,
            title: title,
            isDone: todos[index].isDone
        )
    }

    public func toggleTodo(id: UUID) {
        guard let index = todos.firstIndex(where: { $0.id == id }) else { return }
        todos[index].isDone.toggle()
    }

    public func deleteTodos(ids: [UUID]) {
        todos.removeAll { ids.contains($0.id) }
    }
}

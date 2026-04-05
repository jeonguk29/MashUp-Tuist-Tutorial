//
//  InMemoryTodoRepository.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation
import Domain

final class InMemoryTodoRepository: TodoRepository {
    private var todos: [Todo]

    init(initialTodos: [Todo] = []) {
        self.todos = initialTodos
    }

    func fetchTodos() -> [Todo] {
        todos
    }

    func addTodo(title: String) {
        let newTodo = Todo(title: title, isDone: false)
        todos.append(newTodo)
    }

    func toggleTodo(id: UUID) {
        guard let index = todos.firstIndex(where: { $0.id == id }) else { return }
        todos[index].isDone.toggle()
    }

    func deleteTodos(ids: [UUID]) {
        todos.removeAll { ids.contains($0.id) }
    }
}

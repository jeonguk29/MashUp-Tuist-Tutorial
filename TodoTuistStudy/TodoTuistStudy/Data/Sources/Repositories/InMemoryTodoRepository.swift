//
//  InMemoryTodoRepository.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation
import Domain

public final class InMemoryTodoRepository: TodoRepository {
    private let dataSource: TodoLocalDataSource

    public init(dataSource: TodoLocalDataSource) {
        self.dataSource = dataSource
    }

    public func fetchTodos() -> [Todo] {
        dataSource.fetchTodos().map { $0.toDomain() }
    }

    public func addTodo(title: String) {
        dataSource.addTodo(title: title)
    }

    public func updateTodo(id: UUID, title: String) {
        dataSource.updateTodo(id: id, title: title)
    }

    public func toggleTodo(id: UUID) {
        dataSource.toggleTodo(id: id)
    }

    public func deleteTodos(ids: [UUID]) {
        dataSource.deleteTodos(ids: ids)
    }
}

//
//  TodoRepository.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation

public protocol TodoRepository {
    func fetchTodos() -> [Todo]
    func addTodo(title: String)
    func updateTodo(id: UUID, title: String)
    func toggleTodo(id: UUID)
    func deleteTodos(ids: [UUID])
}

//
//  TodoLocalDataSource.swift
//  Domain
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation

public protocol TodoLocalDataSource {
    func fetchTodos() -> [TodoDTO]
    func addTodo(title: String)
    func toggleTodo(id: UUID)
    func deleteTodos(ids: [UUID])
}

//
//  DeleteTodoUseCase.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation

public struct DeleteTodoUseCase {
    private let repository: TodoRepository

    public init(repository: TodoRepository) {
        self.repository = repository
    }

    public func execute(ids: [UUID]) {
        repository.deleteTodos(ids: ids)
    }
}

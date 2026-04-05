//
//  DeleteTodoUseCase.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation

struct DeleteTodoUseCase {
    private let repository: TodoRepository

    init(repository: TodoRepository) {
        self.repository = repository
    }

    func execute(ids: [UUID]) {
        repository.deleteTodos(ids: ids)
    }
}

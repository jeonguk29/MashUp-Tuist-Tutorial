//
//  ToggleTodoUseCase.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation

struct ToggleTodoUseCase {
    private let repository: TodoRepository

    init(repository: TodoRepository) {
        self.repository = repository
    }

    func execute(id: UUID) {
        repository.toggleTodo(id: id)
    }
}

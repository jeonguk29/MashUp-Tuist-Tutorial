//
//  ToggleTodoUseCase.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation
import DataInterface

public struct ToggleTodoUseCase {
    private let repository: TodoRepository

    public init(repository: TodoRepository) {
        self.repository = repository
    }

    public func execute(id: UUID) {
        repository.toggleTodo(id: id)
    }
}

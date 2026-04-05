//
//  FetchTodosUseCase.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation

public struct FetchTodosUseCase {
    private let repository: TodoRepository

    public init(repository: TodoRepository) {
        self.repository = repository
    }

    public func execute() -> [Todo] {
        repository.fetchTodos()
    }
}

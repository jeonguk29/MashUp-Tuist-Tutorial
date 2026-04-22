//
//  TodoRepository.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation

public struct AddTodoUseCase {
    private let repository: TodoRepository

    public init(repository: TodoRepository) {
        self.repository = repository
    }

    // “빈 문자열이면 추가하지 않는다” 라는 규칙
    public func execute(title: String) -> Bool {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmedTitle.isEmpty == false else { return false }

        repository.addTodo(title: trimmedTitle)
        return true
    }
}

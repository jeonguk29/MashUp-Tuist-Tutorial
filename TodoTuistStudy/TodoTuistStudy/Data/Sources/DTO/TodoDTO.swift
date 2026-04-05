//
//  TodoDTO.swift
//  Domain
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation
import Domain

public struct TodoDTO {
    public let id: UUID
    public let title: String
    public var isDone: Bool

    public init(id: UUID, title: String, isDone: Bool) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
}

public extension TodoDTO {
    func toDomain() -> Todo {
        Todo(
            id: id,
            title: title,
            isDone: isDone
        )
    }
}

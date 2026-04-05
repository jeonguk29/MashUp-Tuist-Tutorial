//
//  Todo.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation

public struct Todo: Identifiable, Equatable {
    public let id: UUID
    public var title: String
    public var isDone: Bool

    public init(id: UUID = UUID(), title: String, isDone: Bool) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
}

//
//  Todo.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var isDone: Bool
}

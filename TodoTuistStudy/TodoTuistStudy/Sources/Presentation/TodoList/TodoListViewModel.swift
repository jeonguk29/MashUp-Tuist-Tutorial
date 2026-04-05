//
//  TodoListViewModel.swift
//  TodoTuistStudy
//
//  Created by 정정욱 on 4/5/26.
//

import Foundation

final class TodoListViewModel: ObservableObject {
    @Published private(set) var state = TodoListState()

    private let fetchTodosUseCase: FetchTodosUseCase
    private let addTodoUseCase: AddTodoUseCase
    private let toggleTodoUseCase: ToggleTodoUseCase
    private let deleteTodoUseCase: DeleteTodoUseCase

    init(
        fetchTodosUseCase: FetchTodosUseCase,
        addTodoUseCase: AddTodoUseCase,
        toggleTodoUseCase: ToggleTodoUseCase,
        deleteTodoUseCase: DeleteTodoUseCase
    ) {
        self.fetchTodosUseCase = fetchTodosUseCase
        self.addTodoUseCase = addTodoUseCase
        self.toggleTodoUseCase = toggleTodoUseCase
        self.deleteTodoUseCase = deleteTodoUseCase

        loadTodos()
    }

    func updateNewTodoText(_ text: String) {
        state.newTodoText = text
    }

    func addTodo() {
        let isAdded = addTodoUseCase.execute(title: state.newTodoText)
        guard isAdded else { return }

        state.newTodoText = ""
        loadTodos()
    }

    func toggleTodo(id: UUID) {
        toggleTodoUseCase.execute(id: id)
        loadTodos()
    }

    func deleteTodo(at offsets: IndexSet) {
        let ids = offsets.map { state.todos[$0].id }
        deleteTodoUseCase.execute(ids: ids)
        loadTodos()
    }

    private func loadTodos() {
        state.todos = fetchTodosUseCase.execute()
    }
}

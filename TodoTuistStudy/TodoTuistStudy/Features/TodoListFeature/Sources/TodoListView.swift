import SwiftUI
import Domain

public struct TodoListView: View {
    @StateObject private var viewModel: TodoListViewModel

    private let onSelectTodo: (UUID) -> Void
    private let onCreateTodo: () -> Void

    public init(
        viewModel: TodoListViewModel,
        onSelectTodo: @escaping (UUID) -> Void,
        onCreateTodo: @escaping () -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onSelectTodo = onSelectTodo
        self.onCreateTodo = onCreateTodo
    }

    public var body: some View {
        List {
            if viewModel.state.todos.isEmpty {
                Text("등록된 할 일이 없습니다.")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(viewModel.state.todos) { todo in
                    HStack(spacing: 12) {
                        Button {
                            viewModel.toggleTodo(id: todo.id)
                        } label: {
                            Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                                .font(.system(size: 22))
                        }
                        .buttonStyle(.plain)

                        Button {
                            onSelectTodo(todo.id)
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(todo.title)
                                    .strikethrough(todo.isDone)
                                    .foregroundStyle(todo.isDone ? .gray : .primary)

                                Text(todo.isDone ? "완료됨" : "진행 중")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.vertical, 4)
                }
                .onDelete(perform: viewModel.deleteTodo)
            }
        }
        .listStyle(.plain)
        .navigationTitle("TODO")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("추가") {
                    onCreateTodo()
                }
            }
        }
        .onAppear {
            viewModel.loadTodos()
        }
    }
}

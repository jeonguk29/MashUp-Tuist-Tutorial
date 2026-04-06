import SwiftUI

public struct TodoDetailView: View {
    @StateObject private var viewModel: TodoDetailViewModel

    private let onEditTodo: (UUID) -> Void
    private let onDeleted: () -> Void

    public init(
        viewModel: TodoDetailViewModel,
        onEditTodo: @escaping (UUID) -> Void,
        onDeleted: @escaping () -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onEditTodo = onEditTodo
        self.onDeleted = onDeleted
    }

    public var body: some View {
        Group {
            if let todo = viewModel.state.todo {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("제목")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text(todo.title)
                            .font(.title2.weight(.semibold))
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("상태")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text(todo.isDone ? "완료됨" : "진행 중")
                            .foregroundStyle(todo.isDone ? .green : .primary)
                    }

                    Button(todo.isDone ? "미완료로 변경" : "완료로 변경") {
                        viewModel.toggleTodo()
                    }
                    .buttonStyle(.borderedProminent)

                    Button("삭제", role: .destructive) {
                        viewModel.deleteTodo()
                        onDeleted()
                    }
                    .buttonStyle(.bordered)

                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(20)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("수정") {
                            onEditTodo(todo.id)
                        }
                    }
                }
            } else {
                ContentUnavailableView("할 일을 찾을 수 없습니다.", systemImage: "exclamationmark.circle")
            }
        }
        .navigationTitle("상세")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadTodo()
        }
    }
}

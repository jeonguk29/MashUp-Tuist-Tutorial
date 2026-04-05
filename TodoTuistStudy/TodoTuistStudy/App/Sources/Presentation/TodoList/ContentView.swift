import SwiftUI
import Domain

struct ContentView: View {
    @StateObject private var viewModel: TodoListViewModel

    init(viewModel: TodoListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                inputSection

                List {
                    ForEach(viewModel.state.todos) { todo in
                        HStack(spacing: 12) {
                            Button {
                                viewModel.toggleTodo(id: todo.id)
                            } label: {
                                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                                    .font(.system(size: 22))
                            }
                            .buttonStyle(.plain)

                            Text(todo.title)
                                .strikethrough(todo.isDone)
                                .foregroundStyle(todo.isDone ? .gray : .primary)
                        }
                        .padding(.vertical, 4)
                    }
                    .onDelete(perform: viewModel.deleteTodo)
                }
                .listStyle(.plain)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .navigationTitle("TODO")
        }
    }
}

private extension ContentView {
    var inputSection: some View {
        HStack(spacing: 8) {
            TextField(
                "할 일을 입력하세요",
                text: Binding(
                    get: { viewModel.state.newTodoText },
                    set: { viewModel.updateNewTodoText($0) }
                )
            )
            .textFieldStyle(.roundedBorder)

            Button("추가") {
                viewModel.addTodo()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

import SwiftUI
import TodoListFeature
import TodoDetailFeature
import TodoEditFeature

struct AppCoordinatorView: View {

    // MARK: - State

    @State private var path: [Route] = []

    // MARK: - DI

    private let container: AppDIContainer

    // MARK: - Init

    init(container: AppDIContainer = AppDIContainer()) {
        self.container = container
    }

    // MARK: - Body

    var body: some View {
        NavigationStack(path: $path) {
            TodoListView(
                viewModel: container.makeTodoListViewModel(),
                onSelectTodo: { todoID in
                    path.append(.detail(todoID))
                },
                onCreateTodo: {
                    path.append(.createTodo)
                }
            )
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .detail(let todoID):
                    TodoDetailView(
                        viewModel: container.makeTodoDetailViewModel(todoID: todoID),
                        onEditTodo: { id in
                            path.append(.editTodo(id))
                        },
                        onDeleted: {
                            path.removeLast()
                        }
                    )
                case .createTodo:
                    TodoEditView(
                        viewModel: container.makeTodoEditViewModelForCreate(),
                        onCompleted: {
                            path.removeLast()
                        }
                    )
                case .editTodo(let todoID):
                    if let viewModel = container.makeTodoEditViewModelForEdit(todoID: todoID) {
                        TodoEditView(
                            viewModel: viewModel,
                            onCompleted: {
                                path.removeLast()
                            }
                        )
                    } else {
                        Text("할 일을 찾을 수 없습니다.")
                    }
                }
            }
        }
    }
}

import SwiftUI
import Domain
import Repository
import CacheData
import NetworkData
import TodoListFeature
import TodoDetailFeature
import TodoEditFeature

@main
struct TodoTuistStudyApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
        }
    }
}

private struct AppCoordinatorView: View {
    @State private var path: [Route] = []

    private let fetchTodosUseCase: FetchTodosUseCase
    private let addTodoUseCase: AddTodoUseCase
    private let updateTodoUseCase: UpdateTodoUseCase
    private let toggleTodoUseCase: ToggleTodoUseCase
    private let deleteTodoUseCase: DeleteTodoUseCase

    init() {
        // 학습용 예시:
        // CacheData / NetworkData는 DataSource 프로토콜만 구현한다 (DTO-only, Domain 모름).
        // Repository 모듈이 두 DataSource를 조율하고 DTO→Entity 변환을 담당한다.
        let cacheSource: any CachedTodoDataSource = InMemoryCachedTodoDataSource()
        let networkSource: any NetworkTodoDataSource = InMemoryNetworkTodoDataSource()
        let repository: TodoRepository = CompositeTodoRepository(
            cache: cacheSource,
            network: networkSource
        )
        self.fetchTodosUseCase = FetchTodosUseCase(repository: repository)
        self.addTodoUseCase = AddTodoUseCase(repository: repository)
        self.updateTodoUseCase = UpdateTodoUseCase(repository: repository)
        self.toggleTodoUseCase = ToggleTodoUseCase(repository: repository)
        self.deleteTodoUseCase = DeleteTodoUseCase(repository: repository)
    }

    var body: some View {
        NavigationStack(path: $path) {
            TodoListView(
                viewModel: TodoListViewModel(
                    fetchTodosUseCase: fetchTodosUseCase,
                    toggleTodoUseCase: toggleTodoUseCase,
                    deleteTodoUseCase: deleteTodoUseCase
                ),
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
                        viewModel: TodoDetailViewModel(
                            todoID: todoID,
                            fetchTodosUseCase: fetchTodosUseCase,
                            toggleTodoUseCase: toggleTodoUseCase,
                            deleteTodoUseCase: deleteTodoUseCase
                        ),
                        onEditTodo: { id in
                            path.append(.editTodo(id))
                        },
                        onDeleted: {
                            path.removeLast()
                        }
                    )
                case .createTodo:
                    TodoEditView(
                        viewModel: TodoEditViewModel(
                            mode: .create,
                            addTodoUseCase: addTodoUseCase,
                            updateTodoUseCase: updateTodoUseCase
                        ),
                        onCompleted: {
                            path.removeLast()
                        }
                    )
                case .editTodo(let todoID):
                    if let todo = fetchTodo(id: todoID) {
                        TodoEditView(
                            viewModel: TodoEditViewModel(
                                mode: .edit(todo),
                                addTodoUseCase: addTodoUseCase,
                                updateTodoUseCase: updateTodoUseCase
                            ),
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

    private func fetchTodo(id: UUID) -> Todo? {
        fetchTodosUseCase.execute().first(where: { $0.id == id })
    }
}

private enum Route: Hashable {
    case detail(UUID)
    case createTodo
    case editTodo(UUID)
}

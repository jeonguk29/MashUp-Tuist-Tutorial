import SwiftUI
import TodoEditFeature
import Domain
import Repository
import CacheData
import NetworkData

@main
struct TodoEditDemoApp: App {
    @State private var container = TodoEditDemoContainer()

    var body: some Scene {
        WindowGroup {
            TodoEditView(
                viewModel: container.makeViewModelForCreate(),
                onCompleted: { }
            )
        }
    }
}

@MainActor
private final class TodoEditDemoContainer {
    private let repository: TodoRepository

    let addTodoUseCase: AddTodoUseCase
    let updateTodoUseCase: UpdateTodoUseCase
    let fetchTodosUseCase: FetchTodosUseCase

    init() {
        let cacheSource: any CachedTodoDataSource = InMemoryCachedTodoDataSource()
        let networkSource: any NetworkTodoDataSource = InMemoryNetworkTodoDataSource()
        let repo: TodoRepository = CompositeTodoRepository(
            cache: cacheSource,
            network: networkSource
        )
        self.repository = repo
        self.addTodoUseCase = AddTodoUseCase(repository: repo)
        self.updateTodoUseCase = UpdateTodoUseCase(repository: repo)
        self.fetchTodosUseCase = FetchTodosUseCase(repository: repo)
    }

    func makeViewModelForCreate() -> TodoEditViewModel {
        TodoEditViewModel(
            mode: .create,
            addTodoUseCase: addTodoUseCase,
            updateTodoUseCase: updateTodoUseCase
        )
    }

    func makeViewModelForEdit(todoID: UUID) -> TodoEditViewModel? {
        guard let todo = fetchTodosUseCase.execute().first(where: { $0.id == todoID })
        else { return nil }
        return TodoEditViewModel(
            mode: .edit(todo),
            addTodoUseCase: addTodoUseCase,
            updateTodoUseCase: updateTodoUseCase
        )
    }
}

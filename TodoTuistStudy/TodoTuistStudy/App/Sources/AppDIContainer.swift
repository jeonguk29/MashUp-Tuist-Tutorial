import Foundation
import Domain
import Repository
import CacheData
import NetworkData
import TodoListFeature
import TodoDetailFeature
import TodoEditFeature

@MainActor
final class AppDIContainer {

    // MARK: - Infrastructure

    private let repository: TodoRepository

    // MARK: - Use Cases

    let fetchTodosUseCase: FetchTodosUseCase
    let addTodoUseCase: AddTodoUseCase
    let updateTodoUseCase: UpdateTodoUseCase
    let toggleTodoUseCase: ToggleTodoUseCase
    let deleteTodoUseCase: DeleteTodoUseCase

    // MARK: - Init

    init() {
        // CacheData / NetworkData는 DataSource 프로토콜만 구현한다 (DTO-only, Domain 모름).
        // Repository 모듈이 두 DataSource를 조율하고 DTO→Entity 변환을 담당한다.
        let cacheSource: any CachedTodoDataSource = InMemoryCachedTodoDataSource()
        let networkSource: any NetworkTodoDataSource = InMemoryNetworkTodoDataSource()
        let repo: TodoRepository = CompositeTodoRepository(
            cache: cacheSource,
            network: networkSource
        )
        self.repository = repo
        self.fetchTodosUseCase  = FetchTodosUseCase(repository: repo)
        self.addTodoUseCase     = AddTodoUseCase(repository: repo)
        self.updateTodoUseCase  = UpdateTodoUseCase(repository: repo)
        self.toggleTodoUseCase  = ToggleTodoUseCase(repository: repo)
        self.deleteTodoUseCase  = DeleteTodoUseCase(repository: repo)
    }

    // MARK: - ViewModel Factories

    func makeTodoListViewModel() -> TodoListViewModel {
        TodoListViewModel(
            fetchTodosUseCase: fetchTodosUseCase,
            toggleTodoUseCase: toggleTodoUseCase,
            deleteTodoUseCase: deleteTodoUseCase
        )
    }

    func makeTodoDetailViewModel(todoID: UUID) -> TodoDetailViewModel {
        TodoDetailViewModel(
            todoID: todoID,
            fetchTodosUseCase: fetchTodosUseCase,
            toggleTodoUseCase: toggleTodoUseCase,
            deleteTodoUseCase: deleteTodoUseCase
        )
    }

    func makeTodoEditViewModelForCreate() -> TodoEditViewModel {
        TodoEditViewModel(
            mode: .create,
            addTodoUseCase: addTodoUseCase,
            updateTodoUseCase: updateTodoUseCase
        )
    }

    func makeTodoEditViewModelForEdit(todoID: UUID) -> TodoEditViewModel? {
        guard let todo = fetchTodo(id: todoID) else { return nil }
        return TodoEditViewModel(
            mode: .edit(todo),
            addTodoUseCase: addTodoUseCase,
            updateTodoUseCase: updateTodoUseCase
        )
    }

    func fetchTodo(id: UUID) -> Todo? {
        fetchTodosUseCase.execute().first(where: { $0.id == id })
    }
}

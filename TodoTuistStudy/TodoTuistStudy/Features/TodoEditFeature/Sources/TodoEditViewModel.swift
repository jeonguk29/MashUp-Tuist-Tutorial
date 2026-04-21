import Foundation
import Domain
import DataInterface

@MainActor
public final class TodoEditViewModel: ObservableObject {
    @Published public private(set) var state: TodoEditState

    public let mode: TodoEditMode

    private let addTodoUseCase: AddTodoUseCase
    private let updateTodoUseCase: UpdateTodoUseCase

    public init(
        mode: TodoEditMode,
        addTodoUseCase: AddTodoUseCase,
        updateTodoUseCase: UpdateTodoUseCase
    ) {
        self.mode = mode
        self.addTodoUseCase = addTodoUseCase
        self.updateTodoUseCase = updateTodoUseCase

        switch mode {
        case .create:
            self.state = TodoEditState()
        case .edit(let todo):
            self.state = TodoEditState(title: todo.title)
        }
    }

    public var navigationTitle: String {
        switch mode {
        case .create:
            "새 할 일"
        case .edit:
            "할 일 수정"
        }
    }

    public var saveButtonTitle: String {
        switch mode {
        case .create:
            "추가"
        case .edit:
            "저장"
        }
    }

    public func updateTitle(_ title: String) {
        state.title = title
    }

    public func save() -> Bool {
        switch mode {
        case .create:
            addTodoUseCase.execute(title: state.title)
        case .edit(let todo):
            updateTodoUseCase.execute(id: todo.id, title: state.title)
        }
    }
}

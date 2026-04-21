import DataInterface

public struct TodoListState {
    public var todos: [Todo] = []

    public init(todos: [Todo] = []) {
        self.todos = todos
    }
}

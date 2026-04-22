import Domain

public struct TodoDetailState {
    public var todo: Todo?

    public init(todo: Todo? = nil) {
        self.todo = todo
    }
}

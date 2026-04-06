import SwiftUI

public struct TodoEditView: View {
    @StateObject private var viewModel: TodoEditViewModel

    private let onCompleted: () -> Void

    public init(
        viewModel: TodoEditViewModel,
        onCompleted: @escaping () -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onCompleted = onCompleted
    }

    public var body: some View {
        Form {
            Section("할 일") {
                TextField(
                    "할 일을 입력하세요",
                    text: Binding(
                        get: { viewModel.state.title },
                        set: { viewModel.updateTitle($0) }
                    )
                )
            }
        }
        .navigationTitle(viewModel.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(viewModel.saveButtonTitle) {
                    guard viewModel.save() else { return }
                    onCompleted()
                }
            }
        }
    }
}

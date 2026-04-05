import SwiftUI

struct ContentView: View {
    // Data 역할까지 같이 하고 있는 상태
    @State private var todos: [Todo] = [
        Todo(title: "Tuist 프로젝트 구조 이해하기", isDone: false),
        Todo(title: "가장 작은 TODO 앱 만들기", isDone: true)
    ]
    
    @State private var newTodoText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                inputSection
                
                List {
                    ForEach($todos) { $todo in
                        HStack(spacing: 12) {
                            Button {
                                todo.isDone.toggle()
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
                    .onDelete(perform: deleteTodo)
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
            TextField("할 일을 입력하세요", text: $newTodoText)
                .textFieldStyle(.roundedBorder)
            
            Button("추가") {
                addTodo()
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    // Domain 규칙
    func addTodo() {
        let trimmedText = newTodoText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard trimmedText.isEmpty == false else { return }
        
        todos.append(Todo(title: trimmedText, isDone: false))
        newTodoText = ""
    }
    
    // Domain 규칙
    func deleteTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

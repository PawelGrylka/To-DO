import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: ListViewModel // Powiązanie z ViewModel
    @Environment(\.dismiss) var dismiss // Zamknięcie widoku
    @State private var title = ""
    @State private var details = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Task")) {
                    TextField("Tytuł", text: $title)
                    TextField("Szczegóły", text: $details)
                    TextField("Opis", text: $description)
                }

                Button(action: {
                    // Dodawanie nowego zadania do ViewModelu
                    viewModel.data.append(
                        ItemModel(title: title, details: details, decription: description, Done: false)
                    )
                    dismiss() // Zamknięcie widoku po dodaniu
                }) {
                    Text("Dodaj Zadanie")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Add Task")
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            })
        }
    }
}

#Preview {
    AddTaskView(viewModel: ListViewModel())
}

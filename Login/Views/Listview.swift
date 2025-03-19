import SwiftUI

struct ListView: View {
    @State private var username = "User"
    @StateObject private var viewModel = ListViewModel()
    @State var isShowingAddTaskForm = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HStack {
                    Text("Welcome \(username)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.8))
                
                Spacer()
                
                // Lista elementów
                List {
                    // Przycisk dodawania nowego elementu
                    Button("+") {
                        isShowingAddTaskForm = true
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .listRowSeparator(.hidden)
                    .opacity(0.6)
                    
                    // Dane z listy
                    ForEach(viewModel.data) { item in
                        NavigationLink(destination: DetailView(item: item, viewModel: viewModel)) {
                            Text(item.title)
                                .frame(height: 40)
                                .padding(.vertical, 10)
                        }
                    }
                }
                .listStyle(.plain) // Styl listy
             
                .sheet(isPresented: $isShowingAddTaskForm) {
                    AddTaskView(viewModel: viewModel)
                }
            }
        }
    }
}

struct DetailView: View {
    let item: ItemModel
    @ObservedObject var viewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    @State private var isShowingAlert = false

    var body: some View {
        VStack {
            Text(item.title)
                .font(.largeTitle)
                .padding()

            Text(item.details)
                .font(.body)
                .padding()
            Text("\(item.Done)")
                .font(.body)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Details")
        VStack{
            Button("Done"){
                if let index = viewModel.data.firstIndex(where: { $0.id == item.id }) {
                    viewModel.data[index].Done = true
                }
            }
                .frame(maxWidth: .infinity, maxHeight: 15)
                .padding()
                .background(Color.green.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(10)
        
            Button("Delete"){
                isShowingAlert = true
                }
                .frame(maxWidth: .infinity, maxHeight: 15)
                .padding()
                .background(Color.red.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding(20)
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("Confirm"), // Tytuł alertu
                message: Text("Are you sure you want to delete this item?"),
                primaryButton: .destructive(Text("Delete")) {
                    viewModel.removeItem(item: item)
                    dismiss()
                },
                secondaryButton: .cancel(Text("Cancel"))
            )
        }

        }
    }


#Preview {
    ListView()
}

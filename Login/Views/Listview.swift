import SwiftUI

struct ListView: View {
    @State private var username = "User"
    @StateObject private var viewModel = ListViewModel()

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
//                        viewModel.data.append(
//                            ItemModel(title: "Nowy element", details: "Szczegóły")
//                        )
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
                        NavigationLink(destination: DetailView(item: item)) {
                            Text(item.title)
                                .frame(height: 40)
                                .padding(.vertical, 10)
                        }
                    }
                }
                .listStyle(.plain) // Styl listy
            }
        }
    }
}

struct DetailView: View {
    let item: ItemModel

    var body: some View {
        VStack {
            Text(item.title)
                .font(.largeTitle)
                .padding()

            Text(item.details)
                .font(.body)
                .padding()

            Spacer()
        }
        .navigationTitle("Details")
    }
}

#Preview {
    ListView()
}

import SwiftUI

struct HistoryView: View {
    @State private var username = "User"
    @StateObject private var viewModel = ListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HStack {
                    Text("History")
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
                    // Dane z listy
                    ForEach(viewModel.data.filter { $0.Done }) { item in
                        NavigationLink(destination: DetailView2(item: item)) {
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


struct DetailView2: View {
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

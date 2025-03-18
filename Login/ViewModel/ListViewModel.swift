import Foundation

class ListViewModel: ObservableObject {
    @Published var data: [ItemModel] = [
        ItemModel(title: "Wiersz 1", details: "Szczegóły wiersza 1",decription: "TEst", Done: false),
        ItemModel(title: "Wiersz 2", details: "Szczegóły wiersza 2", decription: "test", Done: false),
        ItemModel(title: "Wiersz 3", details: "Szczegóły wiersza 3", decription: "test",Done: true)
    ]
    
    func addItem(title: String, details: String, decription: String, Done: Bool) {
        let newItem = ItemModel(title: title, details: details, decription: decription, Done: false)
        data.append(newItem)
    }
    func deleteItemFromList() {
        
    }
    
    
}

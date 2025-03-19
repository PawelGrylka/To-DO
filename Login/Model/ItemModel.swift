import Foundation

struct ItemModel: Identifiable {
    let id = UUID()
    let title: String
    let details: String
    let decription : String
    var Done : Bool
}

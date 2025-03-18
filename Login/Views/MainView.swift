import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Home")
                }

            HistoryView()
                .tabItem {
                    Image(systemName: "clock.arrow.circlepath")
                    Text("History")
                }

            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    MainView()
}

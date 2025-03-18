

import SwiftUI

struct SettingsView :View {
    
    @State var nightMode = false
    
    var body: some View {
        
        
        VStack {
            // Header
            HStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .background(Color.blue.opacity(0.8))
            
            Spacer()
            
            Form{
                Toggle("Night Mode", isOn: $nightMode)
            }}
    }}
    #Preview {
        SettingsView()
    }


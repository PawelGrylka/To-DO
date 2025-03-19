import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showMainView = false  // Zmieniamy nawigację na MainView

    func Login() {
        print("logowanie")
        showMainView = true  // Po zalogowaniu przechodzimy do MainView
    }

    func Register() {
        print("register")
    }

    var body: some View {
        ZStack {
            VStack {
                // Header
                HStack {
                    Text("Basic To Do List")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.8))

                
                Spacer()

                // Main Content
                VStack {
                    Text("Login")
                        .font(.title)
                    TextField("Login", text: $username)
                        .disableAutocorrection(true)
                        .padding()
                        .frame(height: 50)
                        .multilineTextAlignment(.center)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)

                    Text("Password")
                        .font(.title2)
                        .padding(.top, 20)
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .padding()
                        .frame(height: 50)
                        .multilineTextAlignment(.center)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)

                    Button(action: Login) {
                        Label("Zaloguj", systemImage: "arrow.right")
                            .frame(maxWidth: .infinity, maxHeight: 15)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: 250)
                    .padding(.top, 20)

                    Button(action: Register) {
                        Label("Register", systemImage: "arrow.right")
                            .frame(maxWidth: .infinity, maxHeight: 15)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: 250)
                    .padding(.top, 20)
                }
                .padding(.horizontal, 20)

                Spacer()

                // Footer
                HStack {
                    Text("© 2025 My ToDo App")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.2))
            }
            .fullScreenCover(isPresented: $showMainView) {  // Teraz otwieramy MainView zamiast ListView
                MainView()
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

#Preview {
    ContentView()
}

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    private let ingOrange = Color.orange // Use ING's exact orange color if needed
    
    var body: some View {
        VStack {
            Spacer()
            
            // ING logo (placeholder for now)
            
//            Image(systemName: "house.fill")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .foregroundColor(ingOrange)
//                .padding(.bottom, 50)
            Image("ing")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.bottom, 50)

            
            // Username TextField
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            // Password TextField
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            // Login Button
            Button(action: {
                Task {
                    await viewModel.login()
                }
            }) {
                Text(viewModel.isLoading ? "Logging in..." : "Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(ingOrange)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.top, 20)
            .disabled(viewModel.username.isEmpty || viewModel.password.isEmpty || viewModel.isLoading) // Disable login if empty or loading
            
            // Go to Dashboard Button (only appears after successful login)
            if let user = viewModel.user {
                NavigationLink(destination: DashboardView(user: user)) {  // NavigationLink is enough here
                    Text("Go to Dashboard")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(ingOrange)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.top, 20)
            }

            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

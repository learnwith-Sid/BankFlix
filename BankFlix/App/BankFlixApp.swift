// App/BankStreakApp.swift

import SwiftUI

@main
struct BankFlixApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {  // Root NavigationView here
                           LoginView()     // LoginView is the entry point of the app
                       }
        }
    }
}


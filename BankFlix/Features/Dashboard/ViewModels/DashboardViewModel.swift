
// Features/Dashboard/ViewModels/DashboardViewModel.swift

import Foundation

final class DashboardViewModel: ObservableObject {
    @Published var streakCount = 0

    func fetchStreak(for user: User) {
        // Simulate fetching streak data from backend
        self.streakCount = user.streakCount
    }
}


// Features/Dashboard/Services/StreakService.swift

import Foundation

class StreakService {
    static func fetchStreak(for user: User) async throws -> Streak {
        // Simulate fetching streak data from backend
        await Task.sleep(1 * 1_000_000_000)
        return Streak(count: 7) // Dummy data
    }
}

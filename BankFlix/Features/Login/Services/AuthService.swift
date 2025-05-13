
// Features/Login/Services/AuthService.swift



import Foundation

class AuthService {
    static func login(username: String, password: String) async throws -> User {
        // Simulate backend login logic
        await Task.sleep(1 * 1_000_000_000)  // Simulate a network delay
        
        // Example: You might get these values from a backend service
        let streakCount = 0
        let rewardPoints = 0
        let lastMilestoneRewarded = 0  // Placeholder, should be replaced with actual data
        let lastMilestoneRewardDate: Date? = nil  // Placeholder, should be replaced with actual data
        let lastLoginDate = Date() // Assuming the login happens right now
        
        // Create the user model with all required arguments
        let user = User(
            username: username,
            streakCount: streakCount,
            rewardPoints: rewardPoints,
            lastMilestoneRewarded: lastMilestoneRewarded,
            lastMilestoneRewardDate: lastMilestoneRewardDate,
            lastLoginDate: lastLoginDate
        )
        
        return user
    }
}


import Foundation

struct User: Codable {
    let username: String
    var streakCount: Int
    var rewardPoints: Int = 0
    var lastMilestoneRewarded: Int?  // Track the milestone number rewarded (e.g., 30)
    var lastMilestoneRewardDate: Date?  // Track the date when milestone was rewarded
    var lastLoginDate: Date // Store last login date
    var unlockedBadges: [String] = [] // Store unlocked badges

    // Determine if the investment guide is unlocked for the weekend
    var hasUnlockedInvestmentGuide: Bool {
        guard let lastRewardDate = lastMilestoneRewardDate else {
            return false
        }
        return Calendar.current.isDateInWeekend(lastRewardDate)
    }

    // Mark user as logged in and manage streak count
    mutating func login() {
        let today = Date()
        
        // If user hasn't logged in today, update streak count
        if !Calendar.current.isDateInToday(lastLoginDate) {
            // If user logged in yesterday, increase streak count
            if Calendar.current.isDateInYesterday(lastLoginDate) {
                streakCount += 1
            } else {
                streakCount = 1 // Reset streak if not logged in for more than one day
            }
            lastLoginDate = today
        }
    }

    // Reward an investment guide if it's the weekend and eligible
    mutating func rewardInvestmentGuide() {
        let today = Date()
        
        // Reward an investment guide only if it's the weekend
        if Calendar.current.isDateInWeekend(today) {
            lastMilestoneRewarded = 30 // Update milestone
            rewardPoints += 10 // Add points for the guide
            lastMilestoneRewardDate = today // Track the reward date
        }
    }

    // Unlock a badge if not already unlocked
    mutating func unlockBadge(_ badge: String) {
        if !unlockedBadges.contains(badge) {
            unlockedBadges.append(badge)
        }
    }
}

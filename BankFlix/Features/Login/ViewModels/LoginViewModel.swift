import Foundation

final class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var user: User? = nil
    @Published var isLoading = false  // Show loading state during login
    @Published var errorMessage: String? = nil  // For error messages

    func login() async {
        // Validate inputs
        guard !username.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both username and password."
            return
        }

        isLoading = true
        errorMessage = nil  // Reset any previous error

        // Simulate network delay (to be replaced with actual network request)
        await Task.sleep(2 * 1_000_000_000)

        // Validate the user (replace with actual backend validation logic)
        if username == "Test" && password == "Password" {
            let defaults = UserDefaults.standard
            let calendar = Calendar.current
            let today = calendar.startOfDay(for: Date())

            // Retrieve last login date and streak data from UserDefaults
            let lastLoginDate = defaults.object(forKey: "lastLoginDate") as? Date
            var streakCount = defaults.integer(forKey: "streakCount")
            var rewardPoints = defaults.integer(forKey: "rewardPoints")
            var lastMilestoneRewarded = defaults.integer(forKey: "lastMilestoneRewarded")
            var lastMilestoneRewardDate = defaults.object(forKey: "lastMilestoneRewardDate") as? Date

            // Calculate streak count
            if let lastLogin = lastLoginDate {
                let diff = calendar.dateComponents([.day], from: lastLogin, to: today).day ?? 0

                if diff == 1 {
                    streakCount += 1
                } else if diff > 1 {
                    streakCount = 1 // Reset streak if not logged in for more than one day
                }
            } else {
                streakCount = 1 // If no last login, set streak to 1
            }

            // Reward logic: grant reward points at 30 days
            if streakCount >= 30 && lastMilestoneRewarded < 30 {
                rewardPoints += 10
                lastMilestoneRewarded = 30  // Set the last milestone to 30 days
                lastMilestoneRewardDate = today // Track the reward date
            }

            // Save data to UserDefaults
            defaults.set(today, forKey: "lastLoginDate")
            defaults.set(streakCount, forKey: "streakCount")
            defaults.set(rewardPoints, forKey: "rewardPoints")
            defaults.set(lastMilestoneRewarded, forKey: "lastMilestoneRewarded")
            defaults.set(lastMilestoneRewardDate, forKey: "lastMilestoneRewardDate")

            // Set the user model with updated data, including lastLoginDate and milestones
            user = User(username: username, streakCount: streakCount, rewardPoints: rewardPoints, lastMilestoneRewarded: lastMilestoneRewarded, lastMilestoneRewardDate: lastMilestoneRewardDate, lastLoginDate: today)

            // If it's the weekend, reward the user with the investment guide
            user?.rewardInvestmentGuide()

        } else {
            errorMessage = "Invalid username or password."
        }

        isLoading = false  // End loading state
    }
}

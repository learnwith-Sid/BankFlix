import SwiftUI

struct DashboardView: View {
    var user: User
    private let ingOrange = Color(red: 1.0, green: 0.38, blue: 0.0)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Greeting + Streak Card in a Horizontal Stack (HStack)
                HStack {
                    // Greeting
                    Text("Hi, \(user.username)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(ingOrange)
                        .padding(.top, 20)
                    
                    Spacer()

                    // 🔥 Compact Login Streak Card with Smaller Icon
                    NavigationLink(destination: StreakDetailView(user: user)) {
                        HStack(spacing: 8) {
                            Image(systemName: "flame.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .padding(8)
                                .background(ingOrange)
                                .clipShape(Circle())

                            Text("\(user.streakCount) Days")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.black)
                        }
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    }

                }

                // Cards below
                VStack(spacing: 20) {
                    DashboardCardView(title: "Account Balance", subtitle: "$1,250.75", icon: "creditcard.fill", background: .orange)
                    DashboardCardView(title: "Recent Transactions", subtitle: "3 new transactions", icon: "arrow.left.arrow.right", background: .blue)
                    DashboardCardView(title: "Rewards", subtitle: "2 milestones unlocked!", icon: "gift.fill", background: .green)
                }
                .padding(.top, 20)

                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationTitle("Dashboard") // This works fine now
        .navigationBarTitleDisplayMode(.inline)
    }
}

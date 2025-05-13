import SwiftUI

struct RewardPointsPage: View {
    var user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Title
                HStack {
                    Text("🎯 Reward Points")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Image(systemName: "giftcard.fill")
                        .font(.title)
                        .foregroundColor(.orange)
                }
                .padding(.horizontal)

                // Description
                Text("Earn reward points by completing challenges and smart banking habits!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                // Total Points
                HStack {
                    Text("🎁 Total Points: \(user.rewardPoints)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.green)
                    Spacer()
                }
                .padding(.horizontal)

                // Challenge Cards
                VStack(spacing: 16) {
                    ChallengeCardView(
                        icon: "banknote",
                        title: "New Account",
                        description: "Open a FD account this month",
                        reward: "+100 Points",
                        actionText: "Open Now"
                    )
                    ChallengeCardView(
                        icon: "banknote",
                        title: "Deposit & Earn",
                        description: "Add $50+ to your savings this month",
                        reward: "+100 Points",
                        actionText: "Add Now"
                    )

                    ChallengeCardView(
                        icon: "arrowshape.turn.up.right.circle.fill",
                        title: "Refer & Earn",
                        description: "Invite 3 friends to open accounts",
                        reward: "+1000 Points",
                        actionText: "Invite"
                    )

                    ChallengeCardView(
                        icon: "calendar.badge.clock",
                        title: "Login Streak",
                        description: "Log in 7 days in a row",
                        reward: "+200 Points",
                        actionText: "Keep Going"
                    )
                }
                .padding()

                Spacer()
            }
            .padding(.top)
        }
        .navigationBarTitle("Earn Reward Points", displayMode: .inline)
    }
}

struct ChallengeCardView: View {
    var icon: String
    var title: String
    var description: String
    var reward: String
    var actionText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(10)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                Text(reward)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.green)
            }

            Button(action: {
                print("\(actionText) tapped")
            }) {
                Text(actionText)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 16)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.top, 6)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.15), radius: 5, x: 0, y: 4)
    }
}

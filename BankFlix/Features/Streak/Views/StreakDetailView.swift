import SwiftUI

struct StreakDetailView: View {
    @State var user: User
    @State private var showBadgePopup = false
    @State private var selectedBadge: String? = nil
    @State private var navigateToRewardPage = false
    @State private var showAvatarPicker = false
    @State private var selectedAvatarImageName: String = "ING_Lion"

    private let ingOrange = Color(red: 1.0, green: 0.38, blue: 0.0)

    struct Avatar: Identifiable {
        var id = UUID()
        let name: String
        let imageName: String
        let requiredStreak: Int
    }

    private var availableAvatars: [Avatar] {
        [
            Avatar(name: "Lion", imageName: "ING_Lion", requiredStreak: 0),
            Avatar(name: "Cat", imageName: "Avatar_Cat", requiredStreak: 3),
            Avatar(name: "Monkey", imageName: "Avatar_Monkey", requiredStreak: 5),
            Avatar(name: "Fox", imageName: "Avatar_Fox", requiredStreak: 7),
            Avatar(name: "Tiger", imageName: "Avatar_Tiger", requiredStreak: 10)
        ]
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // Avatar & Greeting
                    HStack {
                        Image(selectedAvatarImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .onTapGesture {
                                showAvatarPicker = true
                            }
                            .padding()

                        VStack(alignment: .leading) {
                            Text("Hi, \(user.username)!")
                                .font(.title)
                                .bold()
                            Text("Keep it up! You’re doing great.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }

                    // Streak Count
                    VStack(alignment: .center, spacing: 8) {
                        Text("Your Login Streak")
                            .font(.title2)
                            .bold()
                        Text("\(user.streakCount) Days")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(ingOrange)
                        Text("🎯 Only \(30 - user.streakCount) days left for a 10 Reward Points!")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(12)

                    // Streak Milestones
                    VStack(alignment: .leading) {
                        Text("Your Milestones")
                            .font(.headline)
                        HStack {
                            ForEach(0..<7) { milestone in
                                Button(action: {
                                    showBadgePopup.toggle()
                                    selectedBadge = milestone < user.streakCount ? "" : nil
                                }) {
                                    Circle()
                                        .fill(milestone < user.streakCount ? ingOrange : Color.gray.opacity(0.3))
                                        .frame(width: 20, height: 20)
                                        .overlay(Circle().stroke(ingOrange, lineWidth: 1))
                                }
                            }
                        }
                        Text("You have unlocked \(min(user.streakCount, 7)) of 7 milestones this week!")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                            .padding(.top, 4)
                    }

                    // Rewards Section
                    if Calendar.current.isDateInWeekend(Date()) && !user.hasUnlockedInvestmentGuide {
                        Text("🎉 You unlocked a new Investment Guide!")
                            .font(.title2)
                            .foregroundColor(.green)
                            .padding(.top)
                        Button("Download Guide") {
                            print("Open/download Investment Guide")
                        }
                    } else {
                        Text("🏅 Badges")
                            .font(.title2)
                            .foregroundColor(.blue)
                            .padding(.top)
                        Text("You’ve earned a special badge for your streak.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    // Tip
                    Text("💡 Tip: Small savings today, big returns tomorrow!")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.top, 10)

                    // Resources
                    VStack(alignment: .leading, spacing: 10) {
                        Text("📚 Useful Resources")
                            .font(.headline)

                        ResourceLinkView(title: "Beginner's Guide to Mutual Funds", fileName: "mutual_funds_guide.pdf")
                        ResourceLinkView(title: "Monthly Investment Plans", fileName: "investment_plans.pdf")
                        ResourceLinkView(title: "Saving Strategies 101", fileName: "saving_tips.pdf")
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 1)

                    Spacer()
                }
                .padding()
            }
            .navigationBarTitle("Streak Details", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                navigateToRewardPage = true
            }) {
                Image(systemName: "giftcard.fill")
                    .font(.title)
                    .foregroundColor(.orange)
            })
            .background(
                NavigationLink(destination: RewardPointsPage(user: user), isActive: $navigateToRewardPage) {
                    EmptyView()
                }
            )

            // Badge Popup
            if showBadgePopup, let badge = selectedBadge {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)

                BadgePopupView(isVisible: $showBadgePopup, user: user, badge: badge)
                    .frame(width: 300)
                    .transition(.scale)
                    .zIndex(1)
            }
        }
        .sheet(isPresented: $showAvatarPicker) {
            VStack(spacing: 20) {
                Text("Choose Your Avatar")
                    .font(.headline)
                    .padding()

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
                    ForEach(availableAvatars) { avatar in
                        VStack {
                            Image(avatar.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .opacity(user.streakCount >= avatar.requiredStreak ? 1.0 : 0.3)
                                .overlay(
                                    user.streakCount < avatar.requiredStreak ?
                                    Image(systemName: "lock.fill")
                                        .foregroundColor(.white)
                                        .background(Circle().fill(Color.black.opacity(0.5)))
                                        .padding(5)
                                    : nil
                                )
                                .onTapGesture {
                                    if user.streakCount >= avatar.requiredStreak {
                                        selectedAvatarImageName = avatar.imageName
                                        showAvatarPicker = false
                                    }
                                }

                            Text(avatar.name)
                                .font(.caption)
                                .foregroundColor(user.streakCount >= avatar.requiredStreak ? .primary : .gray)
                        }
                    }
                }
                .padding()

                Button("Close") {
                    showAvatarPicker = false
                }
                .padding(.top)
            }
        }
    }
}

// Badge View (Bronze, Silver, Gold)
struct BadgeView: View {
    enum BadgeType {
        case bronze, silver, gold
    }

    var badgeType: BadgeType

    var body: some View {
        Button(action: {
            print("Clicked on \(badgeType) badge")
        }) {
            VStack {
                switch badgeType {
                case .bronze:
                    Image(systemName: "star.fill")
                        .foregroundColor(.brown)
                        .font(.system(size: 40))
                case .silver:
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 40))
                case .gold:
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 40))
                }
                Text("\(badgeType) Badge")
                    .font(.footnote)
                    .foregroundColor(.black)
            }
        }
    }
}

// Reusable View for Resource Links
struct ResourceLinkView: View {
    let title: String
    let fileName: String

    var body: some View {
        HStack {
            Image(systemName: "doc.richtext")
                .foregroundColor(.blue)
            Text(title)
            Spacer()
            Button(action: {
                print("Open/download \(fileName)")
            }) {
                Image(systemName: "arrow.down.circle.fill")
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, 5)
    }
}

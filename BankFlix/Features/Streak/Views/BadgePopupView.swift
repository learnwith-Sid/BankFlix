import SwiftUI

struct BadgePopupView: View {
    @Binding var isVisible: Bool
    var user: User
    var badge: String

    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0.0

    private let ingOrange = Color(red: 1.0, green: 0.38, blue: 0.0)
    private let ingLogo = "ING_Lion"

    var body: some View {
        ZStack {
            // Background overlay (optional blur/frost)
//            Color.black.opacity(0.4)
//                .edgesIgnoringSafeArea(.all)
//                .onTapGesture {
//                    withAnimation { isVisible = false }
//                }

            VStack(spacing: 16) {
                // Top bar with action icons
                HStack {
                    Spacer()
                    Button(action: {
                        print("Download tapped")
                    }) {
                        Image(systemName: "arrow.down.circle.fill")
                            .font(.title3)
                            .foregroundColor(.blue)
                    }
                    Button(action: {
                        print("Share tapped")
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title3)
                            .foregroundColor(.orange)
                    }
                }

                // Avatar + Name
                HStack(spacing: 12) {
                    Image(ingLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text(user.username)
                            .font(.title2)
                            .bold()
                        Text("🔥 Streak: \(user.streakCount) Days")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }

                Divider()

                // Badge Image and Title
                VStack(spacing: 10) {
                    Image(systemName: badgeIcon())
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(badgeColor())

                    Text("\(badge.capitalized) Badge Unlocked! 🏅")
                        .font(.title3)
                        .bold()
                        .foregroundColor(badgeColor())
                }

                // Streak Description
                Text("You're on fire! You’ve logged in for \(user.streakCount) days straight.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                if user.streakCount >= 30 {
                    Text("🎁 Reward: 10 points unlocked!")
                        .font(.headline)
                        .foregroundColor(.green)
                }

                // Close Button
                Button("Close") {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isVisible = false
                    }
                }
                .padding(.top, 5)
                .foregroundColor(.red)

                // ING Watermark (subtle branding)
                Image("ing_watermark")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.05)
                    .frame(height: 50)
            }
            .padding(20)
            .frame(maxWidth: 340)
            .background(Color.white) // ✅ White background
            .cornerRadius(20)
            .shadow(radius: 10)
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                    scale = 1.0
                    opacity = 1.0
                }
            }
        }
    }

    private func badgeIcon() -> String {
        switch badge.lowercased() {
            case "bronze": return "star.circle.fill"
            case "silver": return "sparkles"
            case "gold": return "crown.fill"
            default: return "flame.fill"
        }
    }

    private func badgeColor() -> Color {
        switch badge.lowercased() {
            case "bronze": return .brown
            case "silver": return .gray
            case "gold": return .yellow
            default: return ingOrange
        }
    }
}

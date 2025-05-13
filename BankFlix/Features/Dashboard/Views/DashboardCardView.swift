import SwiftUI

struct DashboardCardView: View {
    let title: String
    let subtitle: String
    let icon: String
    let background: Color

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .padding()

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.85))
            }

            Spacer()
        }
        .padding()
        .background(background)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

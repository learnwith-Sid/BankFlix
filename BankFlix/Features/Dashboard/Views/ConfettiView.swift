
// Features/Dashboard/Views/ConfettiView.swift

import SwiftUI

struct ConfettiView: View {
    var body: some View {
        Text("🎊🎉✨")
            .font(.system(size: 50))
            .rotationEffect(.degrees(Double.random(in: -20...20)))
            .offset(x: 0, y: -100)
            .transition(.scale)
    }
}

//
//  CircularLoader.swift
//  lumos Watch App
//
//  Created by Mikail Yilmaz on 10/03/2024.
//

import SwiftUI

struct CircularLoader: View {
    @State private var isAnimating = false
        
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.8)
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    self.isAnimating = true
                }
            }
            .frame(width: 25, height: 25)
            .foregroundColor(MyColors.accent.color)
            .padding()
    }
}

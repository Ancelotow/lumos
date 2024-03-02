//
//  CircularLoader.swift
//  lumos
//
//  Created by Owen Ancelot on 02/03/2024.
//

import Foundation
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
            .frame(width: 50, height: 50)
            .foregroundColor(Color(red: 1, green: 0.53, blue: 0.37))
            .padding()
    }
}

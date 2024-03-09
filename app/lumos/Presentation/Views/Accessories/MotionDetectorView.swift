//
//  MotionDetectorItem.swift
//  lumos
//
//  Created by Owen Ancelot on 05/03/2024.
//

import HomeKit
import SwiftUI

struct MotionDetectorView: View {
    @ObservedObject var viewModel: MotionDetectorViewModel

    init(_ motionDetector: HMAccessory) {
        self.viewModel = MotionDetectorViewModel(motionDetector: motionDetector)
    }

    var body: some View {
        NavigationLink(
            destination: IntrusionHistoryView(accessory: viewModel.motionDetector),
            label: {
                VStack {
                    Image("warning")
                        .frame(width: 50, height: 50)
                        .padding(5)

                    let intrusionText = viewModel.isMotionDetected ? "Intrusion\ndetected !" : "No intrusion\ndetected"
                    Text("\(intrusionText)")
                        .foregroundColor(MyColors.white.color)
                        .font(.system(size: 13))
                        .padding(5)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 150, height: 150)
                .padding(.all, 15)
                .background(viewModel.isMotionDetected ? MyColors.accent.color : MyColors.darkgrey.color.opacity(0.3))
                .cornerRadius(20)
            }
        )
    }
}

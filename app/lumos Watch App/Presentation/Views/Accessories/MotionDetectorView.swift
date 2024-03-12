//
//  MotionDetectorView.swift
//  lumos Watch App
//
//  Created by Mikail Yilmaz on 10/03/2024.
//

import HomeKit
import SwiftUI

struct MotionDetectorView: View {
    @ObservedObject var viewModel: MotionDetectorViewModel

    init(_ motionDetector: HMAccessory) {
        self.viewModel = MotionDetectorViewModel(motionDetector: motionDetector)
    }

    var body: some View {
        VStack {
            Image("little-warning")
                .frame(width: 15, height: 15)
                .padding(5)

            let intrusionText = viewModel.isMotionDetected ? "Intru" : "None"
            Text("\(intrusionText)")
                .foregroundColor(MyColors.white.color)
                .font(.system(size: 13))
                .padding(5)
                .multilineTextAlignment(.center)
        }
        .frame(width: 50, height: 50)
        .padding(.all, 15)
        .background(viewModel.isMotionDetected ? MyColors.accent.color : MyColors.darkgrey.color.opacity(0.3))
        .cornerRadius(20)
    }
}

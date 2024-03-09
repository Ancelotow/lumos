//
//  MotionDetectorItem.swift
//  lumos
//
//  Created by Owen Ancelot on 05/03/2024.
//

import HomeKit
import SwiftUI

struct MotionDetectorItem: View {
    @State var motionDetector: HMAccessory
    @State private var isMotionDetected: Bool = false
    
    init(_ motionDetector: HMAccessory) {
        if let service = motionDetector.services.first(where: { $0.serviceType == HMServiceTypeMotionSensor }) {
            if let motionValue = service.characteristics.first(where: { $0.characteristicType == HMCharacteristicTypeMotionDetected }) {
                isMotionDetected = motionValue.value as? Bool ?? false
            }
        }
        self.motionDetector = motionDetector
    }
    
    var body: some View {
        VStack {
            Image("warning")
                .frame(width: 50, height: 50)
                .padding(5)
            
            let intrusionText = isMotionDetected ? "Intrusion\ndetected !" : "No intrusion\ndetected"
            Text("\(intrusionText)")
                .foregroundColor(MyColors.white.color)
                .font(.system(size: 13))
                .padding(5)
                .multilineTextAlignment(.center)
        }
        .frame(width: 150, height: 150)
        .padding(.all, 15)
        .background(isMotionDetected ? MyColors.accent.color : MyColors.darkgrey.color.opacity(0.3))
        .cornerRadius(20)
    }
}

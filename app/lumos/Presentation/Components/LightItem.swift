//
//  LightItem.swift
//  lumos
//
//  Created by Owen Ancelot on 04/03/2024.
//

import HomeKit
import SwiftUI

struct LightItem: View {
    @State var lightbulb: HMAccessory
    @State private var isOn: Bool = false
    @State private var brightnessValue: Int = 0
    
    init(_ lightbulb: HMAccessory) {
        if let service = lightbulb.services.first(where: { $0.serviceType == HMServiceTypeLightbulb }) {
            if let powerState = service.characteristics.first(where: { $0.characteristicType == HMCharacteristicTypePowerState }) {
                isOn = powerState.value as? Bool ?? false
            }
            if let brightness = service.characteristics.first(where: { $0.characteristicType == HMCharacteristicTypeBrightness }) {
                self.brightnessValue = brightness.value as? Int ?? 0
            }
        }
        self.lightbulb = lightbulb
    }
    
    var body: some View {
        VStack {
            Image("medium-light")
                .frame(width: 50, height: 50)
                .padding(5)
            
            if isOn {
                Text("\(brightnessValue)%")
                    .foregroundColor(MyColors.white.color)
                    .font(.system(size: 13))
                    .padding(5)
            }
        }
        .frame(width: 80, height: 80)
        .padding(.all, 15)
        .background(isOn ? MyColors.accent.color : MyColors.darkgrey.color.opacity(0.3))
        .cornerRadius(20)
    }
}

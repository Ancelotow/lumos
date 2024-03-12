//
//  LightbulbView.swift
//  lumos Watch App
//
//  Created by Mikail Yilmaz on 10/03/2024.
//

import HomeKit
import SwiftUI

struct LightbulbView: View {
    @State var lightbulb: HMAccessory
    @ObservedObject var viewModel: LightBulbViewModel
    
    init(_ lightbulb: HMAccessory) {
        self.viewModel = LightBulbViewModel(lightbulb: lightbulb)
        self.lightbulb = lightbulb
    }
    
    var body: some View {
        VStack {
            Image("light")
                .frame(width: 20, height: 20)
                .padding(5)
            
            if viewModel.isOn {
                Text("\(viewModel.brightness)%")
                    .foregroundColor(MyColors.white.color)
                    .font(.system(size: 13))
                    .padding(5)
            }
        }
        .frame(width: 50, height: 50)
        .padding(.all, 15)
        .background(viewModel.isOn ? MyColors.accent.color : MyColors.darkgrey.color.opacity(0.3))
        .cornerRadius(20)
        .onTapGesture { viewModel.toggleLight() }
    }
}

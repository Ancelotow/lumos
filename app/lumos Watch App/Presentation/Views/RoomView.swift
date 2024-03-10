//
//  RoomView.swift
//  lumos Watch App
//
//  Created by Owen Ancelot on 10/03/2024.
//

import HomeKit
import SwiftUI

struct RoomView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel: RoomViewModel
    private let room: HMRoom
    
    let gridItems = [
        GridItem(.flexible(minimum: 50)),
       GridItem(.flexible(minimum: 50))
   ]
    
    init(_ room: HMRoom) {
        self.room = room
        self.viewModel = RoomViewModel(room)
    }
    
    var body: some View {
        ScrollView {
            
            switch viewModel.state {
                case .loading:
                    CircularLoader()
                
                case .success(let accessories):
                    LazyVGrid(columns: gridItems, spacing: 5) {
                        ForEach(accessories, id: \.self) { accessory in
                            if accessory.isLightbulb() {
                                LightbulbView(accessory)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(5)
                                    .layoutPriority(1)
                            } else if accessory.isSensor() {
                                MotionDetectorView(accessory)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(5)
                                    
                            }
                        }
                    }
                    .padding()
                
                default:
                    Spacer()
            }
        }
        .onAppear {
            viewModel.fetchAccessories()
        }
    }
}

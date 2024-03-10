//
//  RoomItem.swift
//  lumos Watch App
//
//  Created by Owen Ancelot on 10/03/2024.
//

import SwiftUI
import HomeKit

struct RoomItem: View {
    
    private let room: HMRoom
    
    init(_ room: HMRoom) {
        self.room = room
    }
    
    var body: some View {
        NavigationLink(
            destination: RoomView(self.room),
            label: {
                HStack{
                    Image("room")
                        .frame(width: 16, height: 16)
                        .padding(5)
                    
                    Text(room.name)
                        .foregroundColor(MyColors.white.color)
                        .font(.system(size: 13))
                        .fontWeight(Font.Weight.semibold)
                        .padding(5)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .padding(.all, 15)
                .cornerRadius(8)
            }
            
        )
    }
}

//
//  lumosApp.swift
//  lumos
//
//  Created by Owen Ancelot on 05/02/2024.
//

import SwiftUI
import HomeKit
import WrappingHStack


struct HomeView: View {
    @StateObject private var homeManager = HomeManager()
    
    var body: some View {
        LumosBody {
            Title("Welcome back\non Lumos")
            
            if let home = homeManager.home {
                HStack {
                    Spacer()
                    WrappingHStack(0...home.rooms.count, id:\.self) { i in
                        if i == home.rooms.count {
                            RoomItem(icon: "add", title: nil, backgroundColor: Color.black) {
                                NewRoomView()
                            }.padding(.top, 5)
                        } else {
                            RoomItem(icon: "living-room", title: home.rooms[i].name, backgroundColor: MyColors.grey.color.opacity(0.3)) {
                                Text("Living Room View")
                            }.padding(.top, 5)
                        }
                    }
                    Spacer()
                }
                .frame(minWidth: 250)
            }
            
            
            Text("Scenes")
                .foregroundColor(.white)
                .font(.system(size: 32))
                .padding(.top, 10)
            
        }
    }
}

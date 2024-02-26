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
            Text("Welcome back\non Lumos")
                .foregroundColor(.white)
                .font(.system(size: 32))
            
            if let home = homeManager.home {
                HStack {
                    Spacer()
                    WrappingHStack(0...home.rooms.count, id:\.self) { i in
                        if i == home.rooms.count {
                            RoomItem.factoryForAdd().padding(.top, 5)
                        } else {
                            RoomItem.factoryFromHMRoom(room: home.rooms[i]).padding(.top, 5)
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

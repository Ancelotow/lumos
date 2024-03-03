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
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        LumosBody {
            Title("Welcome back\non Lumos")
            
            HStack {
                Spacer()
                WrappingHStack(0...viewModel.rooms.count, id:\.self) { i in
                    if i == viewModel.rooms.count {
                        RoomItem(icon: "add", title: nil, backgroundColor: Color.black) {
                            NewRoomView()
                        }.padding(.top, 5)
                    } else {
                        RoomItem(icon: "living-room", title: viewModel.rooms[i].name, backgroundColor: MyColors.grey.color.opacity(0.3)) {
                            RoomView(viewModel.rooms[i])
                        }.padding(.top, 5)
                    }
                }
                Spacer()
            }
            .frame(minWidth: 250)
            
            
            Text("Scenes")
                .foregroundColor(.white)
                .font(.system(size: 32))
                .padding(.top, 10)
            
        }
        .onAppear {
            viewModel.fetchRooms()
        }
    }
}

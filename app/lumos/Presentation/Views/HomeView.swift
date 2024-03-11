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
    @State private var showingAlert = true
    @State private var alertMessage = ""
    
    var body: some View {
        LumosBody {
            Title("Welcome back\non Lumos")
            
            HStack {
                Spacer()
                
                switch viewModel.state {
                    case .success(let rooms):
                        WrappingHStack(0...rooms.count, id: \.self) { i in
                            if i == rooms.count {
                                RoomItem(icon: "add", title: nil, backgroundColor: MyColors.black.color.opacity(0.8)) {
                                    NewRoomView()
                                }.padding(.top, 5)
                            } else {
                                RoomItem(icon: "living-room", title: rooms[i].name, backgroundColor: MyColors.grey.color.opacity(0.3)) {
                                    RoomView(rooms[i])
                                }.padding(.top, 5)
                            }
                        }
                    
                    case .loading:
                        CircularLoader()
                    
                    
                    case .failure(let message):
                        Text(message)
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

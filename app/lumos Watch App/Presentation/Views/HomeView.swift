//
//  HomeView.swift
//  lumos Watch App
//
//  Created by Mikail Yilmaz on 10/03/2024.
//

import SwiftUI
import HomeKit


struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    @State private var showingAlert = true
    @State private var alertMessage = ""
    
    var body: some View {
        HStack {
            Spacer()
            
            switch viewModel.state {
                case .success(let rooms):
                    List {
                        ForEach(rooms, id: \.self) { room in
                            RoomItem(room)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                
                case .loading:
                    CircularLoader()
                
                case .failure(let message):
                    Text(message)
            }
            
            Spacer()
        }
        .onAppear {
            viewModel.fetchRooms()
        }
    }
}

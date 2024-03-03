//
//  RoomView.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import Foundation
import HomeKit
import SwiftUI
import WrappingHStack

struct RoomView: View {
    private let _room: HMRoom
    @StateObject private var homeManager = HomeManager.Instance
    @State private var isDeleting = false
    
    init(_ room: HMRoom) {
        self._room = room
    }
    
    var body: some View {
        ZStack {
            LumosBody {
                HStack {
                    Title(_room.name)
                    Spacer()
                    MyTextButton(text: "Delete", callback: _confirmationToDelete)
                }
                
                WrappingHStack(0..<_room.accessories.count, id:\.self) { i in
                    Text("\(_room.accessories[i].name) => \(_room.accessories[i].category.description)")
                }
            }
        }
    }
    
    private func _confirmationToDelete() {
        isDeleting = true
    }
    
    private func _deleteRoom() {
        isDeleting = false
        print("Deleting")
    }
    
    private func _cancelDeletation() {
        isDeleting = false
    }
}

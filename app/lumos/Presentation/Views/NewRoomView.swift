//
//  NewRoomView.swift
//  lumos
//
//  Created by Owen Ancelot on 28/02/2024.
//

import SwiftUI
import HomeKit

struct NewRoomView: View {
    @StateObject private var homeManager = HomeManager()
    @Environment(\.presentationMode) var presentationMode
    @State private var roomName: String = ""

    var body: some View {
        LumosBody {
            Text("New room")
                .foregroundColor(.white)
                .font(.system(size: 32))
            
            Spacer()
            
            TextInput(
                title: "Name of your new room",
                value: $roomName
            )
            
            MyButton(
                title: "Validate"
            ) { _addNewRoom() }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
    
    private func _addNewRoom() {
        homeManager.addNewRoom(roomName: roomName) { room, error in
            if let error = error {
                print(error)
            }
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    NewRoomView()
}

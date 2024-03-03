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
    @State private var isShowingPopup = false
    @State private var isLoading = false


    var body: some View {
        ZStack {
            LumosBody {
                Title("New room")
                
                Spacer()
                
                TextInput(
                    title: "Name of your new room",
                    value: $roomName
                )
                
                if isLoading {
                    HStack {
                        Spacer()
                        CircularLoader()
                        Spacer()
                    }
                } else {
                    MyButton(
                        title: "Validate"
                    ) { _addNewRoom() }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            
            if isShowingPopup {
                Popup(message: "Une erreur est survenue", buttonLabel: "Close") {
                    isShowingPopup = false
                }
            }
        }
    }
    
    private func _addNewRoom() {
        isLoading = true
        homeManager.addNewRoom(roomName: roomName) { room, error in
            if let error = error {
                print(error)
                isShowingPopup = true
            } else {
                self.presentationMode.wrappedValue.dismiss()
            }
            isLoading = false
        }
    }
}

#Preview {
    NewRoomView()
}

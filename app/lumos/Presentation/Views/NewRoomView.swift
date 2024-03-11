//
//  NewRoomView.swift
//  lumos
//
//  Created by Owen Ancelot on 28/02/2024.
//

import SwiftUI
import HomeKit

struct NewRoomView: View {
    // Control the application, can come-back
    @Environment(\.presentationMode) var presentationMode
    // Class not event
    @ObservedObject private var viewModel = NewRoomViewModel()
    @State private var roomName = ""
    @State private var isShowingError = false
    @State private var errorMessage = ""

    var body: some View {
        LumosBody {
            Title("New room")
            Spacer()
            TextInput(
                title: "Name of your new room",
                value: $roomName
            )
            
            switch viewModel.state {
                case .loading:
                    HStack {
                        Spacer()
                        CircularLoader()
                        Spacer()
                    }
                
                default:
                    MyButton(title: "Validate", callback: addNewRoom)
                        .frame(maxWidth: .infinity, alignment: .center)
                
            }
        }
        .onReceive(viewModel.$state) { newState in
            handleStateChange(newState)
        }
        .alert(isPresented: $isShowingError) {
            Alert(title: Text(errorMessage))
        }
    }
    
    private func addNewRoom() {
        viewModel.addRoom(name: roomName)
    }
    
    private func handleStateChange(_ newState: NewRoomViewState) {
        switch newState {
            case .success:
                self.presentationMode.wrappedValue.dismiss()
            
            case .failure(let error):
                print("error")
                errorMessage = error
                isShowingError = true
            
            default:
                break
        }
    }
}

#Preview {
    NewRoomView()
}

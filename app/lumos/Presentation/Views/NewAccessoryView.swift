//
//  NewAccessoryView.swift
//  lumos
//
//  Created by Owen Ancelot on 09/03/2024.
//

import SwiftUI
import HomeKit

struct NewAccessoryView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel: NewAccessoryViewModel
    @State private var accessoryName = ""
    @State private var isShowingError = false
    @State private var errorMessage = ""
    private let room: HMRoom
    
    init(_ room: HMRoom) {
        self.room = room
        self.viewModel = NewAccessoryViewModel()
    }

    var body: some View {
        LumosBody {
            Title("New accessory")
            Spacer()
            TextInput(
                title: "Name of your new accessory",
                value: $accessoryName
            )
            
            switch viewModel.state {
                case .loading:
                    HStack {
                        Spacer()
                        CircularLoader()
                        Spacer()
                    }
                
                default:
                    MyButton(title: "Validate", callback: addNewAccessory)
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
    
    private func addNewAccessory() {
        viewModel.addAccessory(name: accessoryName, room: room)
    }
    
    private func handleStateChange(_ newState: NewAccessoryViewState) {
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

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
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel: RoomViewModel
    @State private var showAlert = false
    @State private var errorMessage = ""
    @State private var alertType = TypeAlert.none
    private let room: HMRoom
    
    
    init(_ room: HMRoom) {
        self.room = room
        self.viewModel = RoomViewModel(room)
    }
    
    var body: some View {
        LumosBody {
            HStack {
                Title(room.name)
                Spacer()
                MyTextButton(text: "Delete", callback: _confirmationToDelete)
            }
            
            switch viewModel.state {
                case .loading:
                    CircularLoader()
                
                case .success(let accessories):
                    WrappingHStack(0...accessories.count, id:\.self) { i in
                        if i == accessories.count {
                            AccessoryItem(icon: "little-add", title: nil, backgroundColor: MyColors.black.color.opacity(0.8)) {
                                NewRoomView()
                            }.padding(.top, 5)
                        } else {
                            AccessoryItem(icon: IconHelper.getIcon(accessories[i]), title: accessories[i].name, backgroundColor: MyColors.grey.color.opacity(0.3)) {
                                Text(accessories[i].name)
                            }.padding(.top, 5)
                        }
                    }
                
                default:
                    Spacer()
            }
        }
        .alert(isPresented: $showAlert) {
            switch alertType {
                case .deleting:
                    Alert(
                        title: Text("Are you sure to delete the room \"\(room.name)\""),
                        primaryButton: .default(Text("Cancel")) {
                            alertType = .none
                            showAlert = false
                        },
                        secondaryButton: .destructive(Text("Delete")) {
                            viewModel.delete()
                        }
                    )
                
                default:
                    Alert(title: Text(errorMessage))
            }
        }
        .onReceive(viewModel.$stateDelete) { newState in
            handleStateChange(newState)
        }
        
    }
    
    private func _confirmationToDelete() {
        alertType = .deleting
        showAlert = true
    }
    
    private func handleStateChange(_ newState: RoomViewDeleteState) {
        switch newState {
            case .success:
                alertType = .none
                showAlert = false
                self.presentationMode.wrappedValue.dismiss()
            
            case .failure(let error):
                print("error")
                alertType = .error
                errorMessage = error
                showAlert = true
            
            default:
                break
        }
    }
}

private enum TypeAlert {
    case none
    case error
    case deleting
}

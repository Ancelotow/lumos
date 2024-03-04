//
//  RoomViewState.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import HomeKit

enum RoomViewState {
    case loading
    case success(accessories: [HMAccessory])
    case failure(message: String)
}

enum RoomViewDeleteState {
    case initial
    case loading
    case success
    case failure(message: String)
}

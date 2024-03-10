//
//  RoomViewState.swift
//  lumos Watch App
//
//  Created by Owen Ancelot on 10/03/2024.
//

import HomeKit

enum RoomViewState {
    case loading
    case success(accessories: [HMAccessory])
    case failure(message: String)
}

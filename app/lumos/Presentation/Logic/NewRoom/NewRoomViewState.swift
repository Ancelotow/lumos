//
//  NewRoomState.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import HomeKit

enum NewRoomViewState {
    case initial
    case loading
    case success(room: HMRoom)
    case failure(message: String)
}

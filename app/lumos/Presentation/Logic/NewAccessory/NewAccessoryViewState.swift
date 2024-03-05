//
//  NewAccessoryViewState.swift
//  lumos
//
//  Created by Owen Ancelot on 04/03/2024.
//

import HomeKit

enum NewAccessoryViewState {
    case initial
    case loading
    case success(accessory: HMAccessory)
    case failure(message: String)
}

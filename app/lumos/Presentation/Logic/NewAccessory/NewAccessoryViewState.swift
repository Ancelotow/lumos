//
//  NewAccessoryViewState.swift
//  lumos
//
//  Created by Owen Ancelot on 09/03/2024.
//

import HomeKit

enum NewAccessoryViewState {
    case initial
    case loading
    case success
    case failure(message: String)
}

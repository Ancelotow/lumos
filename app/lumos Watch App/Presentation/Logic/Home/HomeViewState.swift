//
//  HomeViewState.swift
//  lumos Watch App
//
//  Created by Owen Ancelot on 10/03/2024.
//

import HomeKit

enum HomeViewState {
    case loading
    case success(rooms: [HMRoom])
    case failure(message: String)
}

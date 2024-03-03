//
//  HomeState.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import HomeKit

enum HomeViewState {
    case loading
    case success(rooms: [HMRoom])
    case failure(message: String)
}

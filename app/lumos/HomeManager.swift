//
//  HomeManager.swift
//  lumos
//
//  Created by Owen Ancelot on 26/02/2024.
//

import Foundation
import HomeKit

class HomeManager: NSObject, ObservableObject, HMHomeManagerDelegate {
    @Published var home: HMHome?
    let homeManager = HMHomeManager()

    override init() {
        super.init()
        homeManager.delegate = self
    }

    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        self.home = manager.homes.first
    }
}

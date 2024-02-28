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
    
    func addNewRoom(roomName: String, callback: @escaping (HMRoom?, Error?) -> Void) {
        guard let home = self.home else {
            print("You have no home")
            return
        }
        home.addRoom(withName: roomName, completionHandler: callback)
    }

    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        self.home = manager.homes.first
    }
}

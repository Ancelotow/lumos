//
//  HomeManager.swift
//  lumos
//
//  Created by Owen Ancelot on 26/02/2024.
//

import Foundation
import HomeKit

class HomeManager: NSObject, ObservableObject, HMHomeManagerDelegate {
    @Published var home: HMHome?  {
        didSet {
            updateHome()
        }
    }
    private let _manager = HMHomeManager()
    private static var _instance: HomeManager = HomeManager()
    public static var Instance: HomeManager {
        get {
            return _instance
        }
    }
    
    
    private override init() {
        super.init()
        _manager.delegate = self
    }
    
    func addNewRoom(roomName: String, callback: @escaping (HMRoom?, Error?) -> Void) {
        guard let home = self.home else {
            print("You have no home")
            return
        }
        home.addRoom(withName: roomName, completionHandler: callback)
    }
    
    func getRooms() -> [HMRoom] {
        guard let home = self.home else {
            print("You have no home")
            return []
        }
        return home.rooms
    }

    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        self.home = _manager.homes.first
    }
    
    private func updateHome() {
        DispatchQueue.main.async {
            self.objectWillChange.send()
        }
    }
}

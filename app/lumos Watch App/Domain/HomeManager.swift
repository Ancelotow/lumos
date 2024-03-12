//
//  HomeManager.swift
//  lumos Watch App
//
//  Created by Mikail Yilmaz on 10/03/2024.
//

import HomeKit

class HomeManager: NSObject, ObservableObject, HMHomeManagerDelegate {
    @Published private(set) var home: HMHome?  {
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
    
    func getRooms() -> [HMRoom] {
        guard let home = self.home else {
            print("You have no home")
            return []
        }
        return home.rooms
    }
    
    func getAccessories(room: HMRoom) -> [HMAccessory] {
        guard let home = self.home else {
            print("You have no home")
            return []
        }
        let accessories = home.rooms.first { $0.uniqueIdentifier == room.uniqueIdentifier }?.accessories ?? []
        return accessories
    }

    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        self.home = _manager.homes.first
    }
    
    private func updateHome() {
        DispatchQueue.main.async {
            print("Home updated")
            self.objectWillChange.send()
        }
    }
}

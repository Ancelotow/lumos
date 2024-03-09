//
//  HomeManager.swift
//  lumos
//
//  Created by Owen Ancelot on 26/02/2024.
//

import Foundation
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
    
    func addNewRoom(roomName: String, callback: @escaping (HMRoom?, Error?) -> Void) {
        guard let home = self.home else {
            print("You have no home")
            return
        }
        home.addRoom(withName: roomName) { room, error in
            if let error = error {
                callback(nil, error)
                return
            }
            callback(room, nil)
        }
    }
    
    func deleteRoom(room: HMRoom, callback: @escaping (Error?) -> Void) {
        guard let home = self.home else {
            print("You have no home")
            return
        }
        home.removeRoom(room) { error in
            guard let error = error else {
                callback(nil)
                return
            }
            callback(error)
        }
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
    
    func addAccessory(name: String, room: HMRoom, callback: @escaping (Error?) -> Void) {
        guard let home = self.home else {
            print("You have no home")
            return
        }
        let setup = HMAccessorySetupManager()
        let request = HMAccessorySetupRequest()
        request.homeUniqueIdentifier = home.uniqueIdentifier
        request.suggestedAccessoryName = name
        request.suggestedRoomUniqueIdentifier = room.uniqueIdentifier
        setup.performAccessorySetup(using: request) { result, error in
            print("eeee")
            guard error == nil else {
                print(error.debugDescription)
                return
            }
            callback(error)
        }
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

//
//  HomeViewModel.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import Foundation
import HomeKit
import Combine

class HomeViewModel: ObservableObject {
    @Published var rooms: [HMRoom] = [] {
        didSet {
            objectWillChange.send()
        }
    }
    
    init() {
        self.rooms = HomeManager.Instance.getRooms()
        _bind()
    }
    
    private func _bind() {
        HomeManager.Instance.$home
            .map { $0?.rooms ?? [] }
            .assign(to: &$rooms)
    }

    func fetchRooms() {
        rooms = HomeManager.Instance.getRooms()
    }
}

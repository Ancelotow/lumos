//
//  RoomViewModel.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import Combine
import HomeKit

class RoomViewModel: ObservableObject {
    @Published private(set) var state: RoomViewState = .loading {
        didSet {
            objectWillChange.send()
        }
    }
    @Published private(set) var stateDelete: RoomViewDeleteState = .initial {
        didSet {
            objectWillChange.send()
        }
    }
    private var cancellable: AnyCancellable?
    private let homeManager: HomeManager
    private let room: HMRoom

    init(_ room: HMRoom, homeManager: HomeManager = HomeManager.Instance) {
        self.room = room
        self.homeManager = homeManager
        self.state = .loading
        self.stateDelete = .initial
        _bind()
    }
    
    private func _bind() {
        cancellable = homeManager.$home
            .map { $0!.rooms.first(where: { $0.uniqueIdentifier == self.room.uniqueIdentifier }) }
            .map { RoomViewState.success(accessories: $0?.accessories ?? [])  }
            .assign(to: \.state, on: self)
    }

    func delete() {
        self.stateDelete = .loading
        homeManager.deleteRoom(room: room) { error in
            if let error = error {
                self.stateDelete = .failure(message: error.localizedDescription)
                return
            }
            
            self.stateDelete = .success
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}



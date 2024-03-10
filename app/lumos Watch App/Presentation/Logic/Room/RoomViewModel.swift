//
//  RoomViewModel.swift
//  lumos Watch App
//
//  Created by Owen Ancelot on 10/03/2024.
//

import Combine
import HomeKit

class RoomViewModel: ObservableObject {
    @Published private(set) var state: RoomViewState = .loading {
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
        _bind()
    }
    
    private func _bind() {
        cancellable = homeManager.$home
            .map { $0!.rooms.first(where: { $0.uniqueIdentifier == self.room.uniqueIdentifier }) }
            .map { $0?.accessories ?? [] }
            .map { accessories in
                let filterAccs = accessories.filter { $0.isAvailableForApp() }
                let sortedAccs = filterAccs.sorted { $0.sortByCategory($1) }
                return RoomViewState.success(accessories: sortedAccs)
            }
            .assign(to: \.state, on: self)
    }
    
    func fetchAccessories() {
        let accessories = homeManager.getAccessories(room: room)
            .filter { $0.isAvailableForApp() }
            .sorted { $0.sortByCategory($1) }
        
        state = .success(accessories: accessories)
    }
    
    deinit {
        cancellable?.cancel()
    }
}

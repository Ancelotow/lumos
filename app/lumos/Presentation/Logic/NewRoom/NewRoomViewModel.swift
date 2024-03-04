//
//  NewRoomViewModel.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import Combine

class NewRoomViewModel: ObservableObject {
    @Published private(set) var state: NewRoomViewState = .initial {
        didSet {
            objectWillChange.send()
        }
    }
    private let homeManager: HomeManager

   init(homeManager: HomeManager = HomeManager.Instance) {
       self.homeManager = homeManager
       self.state = .initial
   }

    func addRoom(name: String) {
        self.state = .loading
        homeManager.addNewRoom(roomName: name) { room, error in
            if let error = error {
                self.state = .failure(message: error.localizedDescription)
                return
            }
            
            if let room = room {
                self.state = .success(room: room)
                return
            }
            
            self.state = .initial
        }
    }
}

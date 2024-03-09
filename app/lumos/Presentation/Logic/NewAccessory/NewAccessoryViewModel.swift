//
//  NewAccessoryViewModel.swift
//  lumos
//
//  Created by Owen Ancelot on 09/03/2024.
//

import Combine
import HomeKit

class NewAccessoryViewModel: ObservableObject {
    @Published private(set) var state: NewAccessoryViewState = .initial {
        didSet {
            objectWillChange.send()
        }
    }
    private let homeManager: HomeManager

   init(homeManager: HomeManager = HomeManager.Instance) {
       self.homeManager = homeManager
       self.state = .initial
   }

    func addAccessory(name: String, room: HMRoom) {
        self.state = .loading
        homeManager.addAccessory(name: name, room: room) { error in
            if let error = error {
                self.state = .failure(message: error.localizedDescription)
                return
            }
            self.state = .success
        }
    }
}

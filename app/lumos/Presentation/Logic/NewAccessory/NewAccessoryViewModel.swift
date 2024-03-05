//
//  NewAccessoryViewModel.swift
//  lumos
//
//  Created by Owen Ancelot on 04/03/2024.
//

import Combine

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

    func addAccessory(name: String) {
        self.state = .loading
        
    }
}

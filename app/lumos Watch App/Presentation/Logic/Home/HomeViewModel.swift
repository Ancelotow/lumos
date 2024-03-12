//
//  HomeViewModel.swift
//  lumos Watch App
//
//  Created by Mikail Yilmaz on 10/03/2024.
//

import Combine

class HomeViewModel: ObservableObject {
    @Published private(set) var state: HomeViewState = .loading {
        didSet {
            objectWillChange.send()
        }
    }
    private var cancellable: AnyCancellable?
    private let homeManager: HomeManager

   init(homeManager: HomeManager = HomeManager.Instance) {
       self.homeManager = homeManager
       self.state = .loading
       _bind()
   }
    
    private func _bind() {
        cancellable = homeManager.$home
            .map { HomeViewState.success(rooms: $0?.rooms ?? []) }
            .assign(to: \.state, on: self)
    }

    func fetchRooms() {
        state = .success(rooms: homeManager.getRooms())
    }
    
    deinit {
        cancellable?.cancel()
    }
}

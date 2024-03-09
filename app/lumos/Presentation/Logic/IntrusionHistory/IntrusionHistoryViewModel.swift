//
//  IntrusionHistoryViewModel.swift
//  lumos
//
//  Created by Owen Ancelot on 09/03/2024.
//

import Combine
import HomeKit

class IntrusionHistoryViewModel: ObservableObject {
    @Published private(set) var state: IntrusionHistoryViewState = .loading
    public let accessory: HMAccessory
    private let repository: HistoryRepository
    
    init(accessory: HMAccessory, repository: HistoryRepository = HistoryLocalRepository()) {
        self.repository = repository
        self.accessory = accessory
        fetchHistories()
    }
    
    func fetchHistories() {
        self.state = .loading
        self.repository.getHistories(accessoryIdentifier: self.accessory.uniqueIdentifier) { histories, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    self.state = .failure(message: error?.localizedDescription ?? "Unknown error")
                    return
                }
                self.state = .success(histories: histories)
            }
        }
    }
}

//
//  HistoryRepository.swift
//  lumos
//
//  Created by Owen Ancelot on 09/03/2024.
//

import Foundation

protocol HistoryRepository {
    
    func getHistories(accessoryIdentifier: UUID, completion: @escaping ([History], Error?) -> Void) -> Void
    
    func addHistory(history: History, completion: @escaping (Error?) -> Void) -> Void
    
}

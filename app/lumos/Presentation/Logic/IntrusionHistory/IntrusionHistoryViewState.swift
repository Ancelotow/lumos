//
//  IntrusionHistoryViewState.swift
//  lumos
//
//  Created by Owen Ancelot on 09/03/2024.
//

import Foundation

enum IntrusionHistoryViewState {
    case loading
    case success(histories: [History])
    case failure(message: String)
}

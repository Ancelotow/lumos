//
//  lumosApp.swift
//  lumos Watch App
//
//  Created by Owen Ancelot on 05/02/2024.
//

import SwiftUI

@main
struct lumos_Watch_AppApp: App {
    var inst = HomeManager.Instance
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
        }
    }
}

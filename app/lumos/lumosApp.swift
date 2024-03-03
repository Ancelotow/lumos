//
//  lumosApp.swift
//  lumos
//
//  Created by Owen Ancelot on 05/02/2024.
//

import SwiftUI
import HomeKit

@main
struct lumosApp: App {
    let homeManager = HomeManager.Instance
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
        }
    }
}

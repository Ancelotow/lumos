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
    var body: some Scene {
        WindowGroup {
            // Allow to stack view. If not that, no UIView can work
            NavigationStack {
                HomeView()
            }
        }
    }
}

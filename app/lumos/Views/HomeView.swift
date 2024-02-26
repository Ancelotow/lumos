//
//  lumosApp.swift
//  lumos
//
//  Created by Owen Ancelot on 05/02/2024.
//

import SwiftUI
import HomeKit


struct HomeView: View {
    @StateObject private var homeManager = HomeManager()

    var body: some View {
        LumosBody {
            Text("Welcome back\non Lumos")
                .foregroundColor(.white)
                .font(.system(size: 32))
        }
    }
}

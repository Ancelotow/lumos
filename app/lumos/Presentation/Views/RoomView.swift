//
//  RoomView.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import Foundation
import HomeKit
import SwiftUI

struct RoomView: View {
    private var room: HMRoom
    @StateObject private var homeManager = HomeManager()
    
    var body: some View {
        LumosBody {
            Title(room.name)
        }
    }
}

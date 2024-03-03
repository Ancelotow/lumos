//
//  MyColors.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import Foundation
import SwiftUI

enum MyColors {
    case accent
    case grey
    case darkgrey
    case white
    case black

    private static let colors: [MyColors: Color] = [
        .accent: Color(red: 1, green: 0.53, blue: 0.37),
        .grey: Color(red: 0.85, green: 0.85, blue: 0.85),
        .darkgrey: Color(red: 0.76, green: 0.76, blue: 0.76),
        .white: Color.white,
        .black: Color.black
    ]
    
    var color: Color {
        return Self.colors[self] ?? .clear
    }
}

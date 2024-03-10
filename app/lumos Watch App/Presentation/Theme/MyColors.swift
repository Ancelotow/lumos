//
//  MyColors.swift
//  lumos Watch App
//
//  Created by Owen Ancelot on 10/03/2024.
//

import SwiftUI

enum MyColors {
    case accent
    case darkaccent
    case grey
    case darkgrey
    case white
    case black
    case red
    case blue

    private static let colors: [MyColors: Color] = [
        .accent: Color(red: 1, green: 0.53, blue: 0.37),
        .grey: Color(red: 0.85, green: 0.85, blue: 0.85),
        .darkgrey: Color(red: 0.76, green: 0.76, blue: 0.76),
        .darkaccent: Color(red: 0.75, green: 0.29, blue: 0.13),
        .white: Color.white,
        .black: Color.black,
        .red: Color.red,
        .blue: Color.blue
    ]
    
    var color: Color {
        return Self.colors[self] ?? .clear
    }
}

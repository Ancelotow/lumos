//
//  MyButton.swift
//  lumos
//
//  Created by Manon Salsou on 28/02/2024.
//

import SwiftUI

struct MyButton: View {
    var title: String
    var width: CGFloat
    var color: Color
    var callback: () -> Void
    
    init(title: String, callback: @escaping () -> Void, width: CGFloat = 277, color: Color = MyColors.accent.color) {
        self.title = title
        self.callback = callback
        self.width = width
        self.color = color
    }
    
    var body: some View {
        Button(title) {
            callback()
        }
        .frame(width: width, height: 14, alignment: .center)
        .padding()
        .background(color)
        .foregroundColor(MyColors.white.color)
        .fontWeight(Font.Weight.semibold)
        .cornerRadius(8)
        
    }
}

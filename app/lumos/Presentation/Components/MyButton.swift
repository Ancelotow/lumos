//
//  MyButton.swift
//  lumos
//
//  Created by Owen Ancelot on 28/02/2024.
//

import Foundation
import SwiftUI

struct MyButton: View {
    var title: String
    var callback: () -> Void
    
    init(title: String, callback: @escaping () -> Void) {
        self.title = title
        self.callback = callback
    }
    
    var body: some View {
        Button(title) {
            callback()
        }
        .frame(width: 277, height: 14, alignment: .center)
        .padding()
        .background(MyColors.accent.color)
        .foregroundColor(MyColors.white.color)
        .fontWeight(Font.Weight.semibold)
        .cornerRadius(8)
        
    }
}

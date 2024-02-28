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
        .background(Color(red: 1, green: 0.53, blue: 0.37))
        .foregroundColor(.white)
        .fontWeight(Font.Weight.semibold)
        .cornerRadius(8)
        
    }
}

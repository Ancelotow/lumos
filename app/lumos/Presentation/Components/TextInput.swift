//
//  TextInput.swift
//  lumos
//
//  Created by Manon Salsou on 28/02/2024.
//

import Foundation
import SwiftUI

struct TextInput: View {
    var title: String
    // Observable
    var value: Binding<String>
    
    init(title: String, value: Binding<String>) {
        self.title = title
        self.value = value
    }
    
    var body: some View {
        TextField(title, text: value)
            .foregroundColor(MyColors.white.color)
            .frame(height: 14, alignment: .center)
            .padding()
            .background(MyColors.darkgrey.color.opacity(0.3))
            .cornerRadius(8)
        
    }
}

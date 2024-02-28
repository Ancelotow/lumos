//
//  TextInput.swift
//  lumos
//
//  Created by Owen Ancelot on 28/02/2024.
//

import Foundation
import SwiftUI

struct TextInput: View {
    var title: String
    var value: Binding<String>
    
    init(title: String, value: Binding<String>) {
        self.title = title
        self.value = value
    }
    
    var body: some View {
        TextField(title, text: value)
            .foregroundColor(Color.white)
            .frame(height: 14, alignment: .center)
            .padding()
            .background(Color(red: 0.76, green: 0.76, blue: 0.76).opacity(0.3))
            .cornerRadius(8)
        
    }
}

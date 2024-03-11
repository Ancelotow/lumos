//
//  MyTextButton.swift
//  lumos
//
//  Created by Manon Salsou on 03/03/2024.
//

import SwiftUI

struct MyTextButton: View {
    var text: String
    var callback: () -> Void
    
    init(text: String, callback: @escaping () -> Void) {
        self.text = text
        self.callback = callback
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 13))
            .foregroundColor(MyColors.darkaccent.color)
            .onTapGesture {
                callback()
            }
    }
}

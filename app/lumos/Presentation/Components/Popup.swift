//
//  Popup.swift
//  lumos
//
//  Created by Owen Ancelot on 02/03/2024.
//

import SwiftUI

struct Popup: View {
    var message: String
    var buttonLabel: String
    var buttonAction: () -> Void
    
        
    var body: some View {
        Color.black.opacity(0.3)
            .edgesIgnoringSafeArea(.all)
        
        VStack {
            Text(message)
                .foregroundColor(.white)
                .padding()
            
            MyButton(title: buttonLabel, callback: buttonAction)
        }
        .padding()
        .background(Color.black)
        .cornerRadius(20)
        .frame(width: 300, height: 200)
    }
    
}

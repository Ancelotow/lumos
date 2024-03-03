//
//  PopupAction.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import SwiftUI

struct PopupAction: View {
    var message: String
    var okLabel: String
    var cancelLabel: String
    var okAction: () -> Void
    var cancelAction: () -> Void
    
        
    var body: some View {
        MyColors.black.color
            .opacity(0.3)
            .edgesIgnoringSafeArea(.all)
        
        VStack {
            Text(message)
                .foregroundColor(MyColors.white.color)
                .padding()
            
            HStack{
                MyButton(title: cancelLabel, callback: cancelAction, width: 100, color: MyColors.blue.color)
                Spacer()
                MyButton(title: okLabel, callback: okAction, width: 100, color: MyColors.red.color)
            }
        }
        .padding()
        .background(MyColors.black.color)
        .cornerRadius(20)
        .frame(width: 300, height: 200)
    }
    
}

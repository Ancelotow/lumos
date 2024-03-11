//
//  LumosBody.swift
//  lumos
//
//  Created by Manon Salsou on 26/02/2024.
//

import SwiftUI

struct LumosBody<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 10)
        
            MyColors.black.color
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                content
            }
            .padding(.all, 20)
            .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
            .background(MyColors.darkgrey.color.opacity(0.3))
            .cornerRadius(50)
            .padding(.top, 40)
            .padding(.all, 10)
            
        }
    }
    
}

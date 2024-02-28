//
//  LumosBody.swift
//  lumos
//
//  Created by Owen Ancelot on 26/02/2024.
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
        
            Color.black.opacity(0.8)
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
            .background(Color(red: 0.76, green: 0.76, blue: 0.76).opacity(0.3))
            .cornerRadius(50)
            .padding(.top, 40)
            .padding(.all, 10)
        }
    }
}


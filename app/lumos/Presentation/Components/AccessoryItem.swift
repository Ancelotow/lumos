//
//  AccessoryItem.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import HomeKit
import SwiftUI

struct AccessoryItem<Content: View>: View {
    var icon: String!
    var title: String?
    var backgroundColor: Color!
    @ViewBuilder var destination: Content
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: {
                VStack {
                    ZStack {
                        Circle()
                            .foregroundColor(backgroundColor)
                            .frame(width: 45, height: 45)
                        
                        Image(icon)
                            .frame(width: 16, height: 16)
                            .padding(1)
                    }
                    if let title = self.title {
                        Text(title)
                            .foregroundColor(MyColors.white.color)
                            .font(.system(size: 13))
                            .padding(5)
                    }
                    Spacer()
                }
                .frame(width: 60, height: 120)
            }
        )
    }
}

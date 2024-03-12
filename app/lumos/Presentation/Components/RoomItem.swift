//
//  RoomItem.swift
//  lumos
//
//  Created by Manon Salsou on 26/02/2024.
//

import Foundation
import SwiftUI
import HomeKit

struct RoomItem<Content: View>: View {
    var icon: String!
    var title: String?
    var backgroundColor: Color!
    @ViewBuilder var destination: Content
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: {
                VStack {
                    Image(icon)
                        .frame(width: 35, height: 35)
                        .padding(5)
                    if let title = self.title {
                        Text(title)
                            .foregroundColor(MyColors.white.color)
                            .font(.system(size: 13))
                            .fontWeight(Font.Weight.semibold)
                            .padding(5)
                    }
                }
                .frame(width: 80, height: 80)
                .padding(.all, 15)
                .background(backgroundColor)
                .cornerRadius(20)
            }
        )
    }
}

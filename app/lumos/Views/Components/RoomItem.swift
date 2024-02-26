//
//  RoomItem.swift
//  lumos
//
//  Created by Owen Ancelot on 26/02/2024.
//

import Foundation
import SwiftUI
import HomeKit

struct RoomItem: View {
    var icon: String!
    var title: String?
    var backgroundColor: Color!
    var callback: (HMRoom) -> Void
    
    static func factoryForAdd() -> RoomItem {
        return RoomItem(icon: "add", title: nil, backgroundColor: Color.black) { _ in
            // TODO
        }
    }
    
    static func factoryFromHMRoom(room: HMRoom) -> RoomItem {
        return RoomItem(icon: "living-room", title: room.name, backgroundColor: Color.gray) { _ in
            // TODO
        }
    }
    
    init(icon: String!, title: String?, backgroundColor: Color!, callback: @escaping (HMRoom) -> Void) {
        self.icon = icon
        self.title = title
        self.backgroundColor = backgroundColor
        self.callback = callback
    }
    
    var body: some View {
        VStack {
            Image(icon)
                .frame(width: 35, height: 35)
                .padding(5)
            if let title = self.title {
                Text(title)
                    .foregroundColor(.white)
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
}

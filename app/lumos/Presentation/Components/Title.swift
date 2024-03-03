//
//  Title.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import SwiftUI

struct Title: View {
    private let _title: String
    
    init(_ title: String){
        self._title = title
    }
        
    var body: some View {
        Text(_title)
            .foregroundColor(MyColors.white.color)
            .font(.system(size: 32))
    }
}

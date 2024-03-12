//
//  HistoryList.swift
//  lumos
//
//  Created by Manon Salsou on 09/03/2024.
//

import SwiftUI

struct HistoryList: View {
    private let histories: [History]
    
    init(_ histories: [History]){
        self.histories = histories
    }
        
    var body: some View {
        List {
            HStack {
                Text("Type")
                    .frame(maxWidth: 75, alignment: .leading)
                    .padding(5)
                    .foregroundColor(.white)
                
                Text("Date")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .foregroundColor(.white)
                
                Text("Time")
                    .frame(maxWidth: 75, alignment: .leading)
                    .padding(5)
                    .foregroundColor(.white)
            }
            .listRowBackground(MyColors.darkgrey.color.opacity(0.7))
            
            ForEach(histories) { history in
                HStack {
                    Text(history.formattedType())
                        .frame(maxWidth: 75, alignment: .leading)
                        .padding(5)
                        .foregroundColor(.white)

                    Text(history.formattedDate())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        .foregroundColor(.white)
                    
                    Text(history.formattedTime())
                        .frame(maxWidth: 75, alignment: .leading)
                        .padding(5)
                        .foregroundColor(.white)
                }
                .listRowBackground(MyColors.darkgrey.color.opacity(0.3))
            }
        }
        .frame(maxWidth: .infinity)
        .listStyle(PlainListStyle())
        .cornerRadius(8)
    }
}

//
//  IntrusionHistoryView.swift
//  lumos
//
//  Created by Owen Ancelot on 09/03/2024.
//

import HomeKit
import SwiftUI

struct IntrusionHistoryView: View {
    @ObservedObject private var viewModel: IntrusionHistoryViewModel
    @State private var showingAlert = true
    @State private var alertMessage = ""
    
    init(accessory: HMAccessory) {
        self.viewModel = IntrusionHistoryViewModel(accessory: accessory)
    }
    
    var body: some View {
        LumosBody {
            Title("\(viewModel.accessory.room?.name ?? "Room") / \(viewModel.accessory.name)")
            
            Text("History")
                .foregroundColor(MyColors.white.color)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .padding(.top, 10)
            
            HStack {
                Spacer()
                
                switch viewModel.state {
                    case .success(let histories):
                        if histories.isEmpty {
                            Text("No history for this accessory")
                        } else {
                            HistoryList(histories)
                        }
                    
                    case .loading:
                        CircularLoader()
                    
                    case .failure(let message):
                        Text(message)
                }
                
                Spacer()
            }
            .frame(minWidth: 250)
        }
        .onAppear {
            print("View appeared")
            viewModel.fetchHistories()
        }
    }
}



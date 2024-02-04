//
//  ErrorView.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 31.01.24.
//

import SwiftUI

struct ErrorView: View {
    let refreshAction: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            
            VStack {
                Text("Failed to load transactions.")
                Text("Please try again.")
            }
            .font(.headline)
            .foregroundColor(.red)
            .padding()
            
            Button(action: {
                refreshAction()
            }) {
                HStack {
                    Image(systemName: "arrow.clockwise.circle")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                    
                    Text("Retry")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding()
            }
        }
        .padding()
    }
}

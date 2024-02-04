//
//  TransactionDetailsView.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 31.01.24.
//

import ComposableArchitecture
import SwiftUI

struct TransactionDetailsView: View {
    let store: StoreOf<TransactionDetails>
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Partner: \(store.transaction.partnerDisplayName)")
                    .font(.headline)
                    .foregroundColor(.primary)

                Text("Description: \(store.transaction.transactionDetail.description ?? "No Description")")
                    .font(.headline)
                    .foregroundColor(.primary)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Transaction Details")
    }
}

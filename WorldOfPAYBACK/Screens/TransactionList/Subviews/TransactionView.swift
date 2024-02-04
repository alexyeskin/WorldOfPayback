//
//  TransactionView.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 31.01.24.
//

import SwiftUI

struct TransactionView: View {
    let transaction: Transaction
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.partnerDisplayName)
                    .font(.headline)
                    .foregroundColor(.primary)
                if let description = transaction.transactionDetail.description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(transaction.transactionDetail.value.amount) \(transaction.transactionDetail.value.currency)")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("\(transaction.transactionDetail.bookingDate, formatter: dateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .contentShape(Rectangle())
    }
}

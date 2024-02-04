//
//  CategoryFilterView.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 3.02.24.
//

import SwiftUI
import ComposableArchitecture

struct CategoryFilterView: View {
    var store: StoreOf<TransactionList>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            HStack {
                Text("Category:")
                Spacer()
                Picker("Category", selection: viewStore.binding(
                    get: { $0.categoryFilter },
                    send: { .filterTransactionsByCategory($0) }
                )) {
                    ForEach(Transaction.Category.allCases, id: \.self) { category in
                        if category == .withoutCategory {
                            Text("All transactions")
                                .tag(category.rawValue)
                        } else {
                            Text("Category \(category.rawValue)")
                                .tag(category.rawValue)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

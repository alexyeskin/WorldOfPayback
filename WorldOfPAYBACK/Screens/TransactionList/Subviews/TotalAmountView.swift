//
//  TotalAmountView.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 3.02.24.
//

import SwiftUI

struct TotalAmountView: View {
    let totalAmount: Int
    
    var body: some View {
        HStack {
            Text("Total:")
                .font(.headline)
                .foregroundColor(.primary)
            Text("\(totalAmount) PBP")
                .font(.headline)
                .foregroundColor(.blue)
        }
    }
}

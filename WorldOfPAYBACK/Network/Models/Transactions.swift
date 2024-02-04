//
//  Transactions.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 29.01.24.
//

import Foundation

struct Transactions: Decodable, Equatable {
    let items: [Transaction]
}

struct Transaction: Decodable, Equatable, Identifiable {
    var id = UUID()
    
    let partnerDisplayName: String
    let alias: Alias
    let category: Category
    let transactionDetail: TransactionDetail
    
    enum Category: Int, Decodable, Equatable, CaseIterable {
        case withoutCategory
        case firstCategory
        case secondCategory
        case thirdCategory
    }
}

struct TransactionValue: Decodable, Equatable {
    let amount: Int
    let currency: String
}

struct TransactionDetail: Decodable, Equatable {
    let description: String?
    let bookingDate: Date
    let value: TransactionValue
}

struct Alias: Decodable, Equatable {
    let reference: String
}

extension Transaction {
    private enum CodingKeys: String, CodingKey {
        case partnerDisplayName
        case alias
        case category
        case transactionDetail
    }
}

// MARK: - Mock data

extension Transactions {
    static let mock = Self(
        items: [Transaction.mock]
    )
}

extension Transaction {
    static let mock = Transaction(
        partnerDisplayName: "partnerDisplayName",
        alias: Alias(reference: "reference"),
        category: .firstCategory,
        transactionDetail: TransactionDetail(
            description: "description",
            bookingDate: Date(),
            value: TransactionValue(amount: 123, currency: "CUR")
        )
    )
}

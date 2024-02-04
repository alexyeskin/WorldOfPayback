//
//  TransactionClient.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 29.01.24.
//

import ComposableArchitecture
import Foundation

@DependencyClient
struct TransactionClient {
    var transactions: @Sendable () async throws -> Transactions
}

extension DependencyValues {
    var transactionClient: TransactionClient {
        get { self[TransactionClient.self] }
        set { self[TransactionClient.self] = newValue }
    }
}

extension TransactionClient: DependencyKey {
    static var liveValue: TransactionClient {
        return TransactionClient {
            guard let path = Bundle.main.path(forResource: "PBTransactions", ofType: "json") else {
                throw TransactionsError.mockedTransactionsFilePath
            }
            
            try await Task.sleep(until: .now + .seconds(1), clock: .continuous)
            
            if Bool.random() {
                throw TransactionsError.randomFail
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let transactions = try jsonDecoder.decode(Transactions.self, from: data)
                return transactions
            } catch _ as DecodingError {
                throw TransactionsError.decodingError
            } catch {
                throw TransactionsError.unknown
            }
        }
    }
}

extension TransactionClient: TestDependencyKey {
    internal static let previewValue = Self(
        transactions: { .mock }
    )
    
    static let testValue = Self()
}


private let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return decoder
}()

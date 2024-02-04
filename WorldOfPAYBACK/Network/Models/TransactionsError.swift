//
//  TransactionsError.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 29.01.24.
//

import Foundation

enum TransactionsError: Error, Equatable {
    case mockedTransactionsFilePath
    case decodingError
    case randomFail
    
    case unknown
}

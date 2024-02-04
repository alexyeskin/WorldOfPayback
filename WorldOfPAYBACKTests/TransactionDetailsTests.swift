//
//  TransactionDetailsTests.swift
//  WorldOfPAYBACKTests
//
//  Created by Alexander Yeskin on 4.02.24.
//

import XCTest
import ComposableArchitecture
@testable import WorldOfPAYBACK

@MainActor
final class TransactionDetailsTests: XCTestCase {
    func testStore() async {
        let store = TestStore(initialState: TransactionDetails.State(transaction: Transaction.mock)) {
            TransactionDetails()
        }
        
        XCTAssertNotNil(store.state.transaction)
    }
}

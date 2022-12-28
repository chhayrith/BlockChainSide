//
//  transation.swift
//  SwiftBlockChain
//
//  Created by liem on 26/12/22.
//

import Foundation
import Vapor

protocol SmartContract {
    func apply(transaction: Transaction)
}

final class TransactionTypeSmartContract: SmartContract {
    func apply(transaction: Transaction) {
        var fees = 0.0
        switch transaction.transactionType {
        case .domestic:
            fees = 0.02
        default:
            fees = 0.05
        }
        transaction.fees = transaction.amount * fees
        transaction.amount -= transaction.fees ?? 0.0
        print("TransactionTypeSmartContract:", transaction.fees)
    }
}

enum TrasactionType: String, Content{
    case domestic
    case international
}

final class Transaction: Content{
    var from: String
    var to: String
    var amount: Double
    var fees: Double? = 0.0
    var transactionType: TrasactionType
    
    init(from: String, to: String, amount: Double, transactaionType: TrasactionType) {
        self.from = from
        self.to = to
        self.amount = amount
        self.transactionType = transactaionType
    }
}

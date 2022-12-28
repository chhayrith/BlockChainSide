//
//  main.swift
//  SwiftBlockChain
//
//  Created by liem on 26/12/22.
//

import Foundation
import Vapor

final class Block: Content{
    var index = Int()
    var prevoiusHash = String()
    var hash = String()
    var nounce = Int()
    
    private(set) var transacions = [Transaction]()
    
    var key: String{ get{
            let transationData = try! JSONEncoder().encode(transacions)
            let transationJSON = String(data: transationData, encoding: .utf8)!
            return String(self.index) + self.prevoiusHash + String(self.nounce) + transationJSON
    }}
    
    func addTransation(transation: Transaction){
        self.transacions.append(transation)
    }
    
    init() {
        self.nounce = 0
    }
}


//
//  File.swift
//  
//
//  Created by liem on 28/12/22.
//

import Foundation
import Vapor

class BlockchainController{
    private(set) var blockChainService: BlockchainService
    
    init() {
        self.blockChainService = BlockchainService()
    }
    
    func greet(req: Request) -> String{
        return "heelo greet"
    }
    
    func getBlockchain(req: Request) -> BlockChain {
        return self.blockChainService.getBlockchain()
    }
    
    func mine(req: Request, transaction: Transaction) -> Block{
        return self.blockChainService.getNextBlock(transactions: [transaction])
    }
    
}

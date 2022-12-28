//
//  File.swift
//  
//
//  Created by liem on 28/12/22.
//

import Foundation

class BlockchainService{
    
    private(set) var blockchain : BlockChain
    
    init() {
        self.blockchain = BlockChain(genesisBlock: Block())
    }
    
    func getBlockchain() -> BlockChain {
        return self.blockchain
    }
    
    func getNextBlock(transactions: [Transaction]) -> Block {
        let block = self.blockchain.getNextBlock(transations: transactions)
        self.blockchain.addBlock(block)
        return block
    }
}

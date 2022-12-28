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
}

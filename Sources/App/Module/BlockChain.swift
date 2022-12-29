//
//  blockChain.swift
//  SwiftBlockChain
//
//  Created by liem on 26/12/22.
//

import Foundation
import CryptoKit
import Vapor

final class BlockChain: Content{
    private(set) var blocks = [Block]()
    private(set) var smartContract: [SmartContract] = [TransactionTypeSmartContract()]
    private(set) var nodes = [BlockchainNode]()
    
    init(genesisBlock: Block) {
        addBlock(genesisBlock)
    }
    
    private enum CodingKeys: CodingKey{
        case blocks
        case nodes
    }
    
    func registerNodes(nodes: [BlockchainNode]) -> [BlockchainNode] {
        self.nodes.append(contentsOf: nodes)
        return self.nodes
    }
    
    func addBlock(_ block: Block){
        if self.blocks.isEmpty{
            block.prevoiusHash = "0000000000000000"
            block.hash = generateHash(for: block)
        }
        
        self.smartContract.forEach { contract in
            block.transacions.forEach { transaction in
                contract.apply(transaction: transaction)
            }
        }
        self.blocks.append(block)
    }
    
    func getNextBlock(transations: [Transaction]) -> Block{
        let block = Block()
        transations.forEach { transation in
            block.addTransation(transation: transation)
        }
        
        let previousBlock = getPreviousBlock()
        block.index = self.blocks.count
        block.prevoiusHash = previousBlock.hash
        block.hash = generateHash(for: block)
        return block
    }
    
    private func getPreviousBlock() -> Block{
        return self.blocks[self.blocks.count - 1]
    }
    
    func generateHash(for block: Block) -> String{
        var hash = block.key.sha1Hash()
        while !hash.hasPrefix("00"){
            block.nounce += 1
            hash = block.key.sha1Hash()
        }
        print(hash)
        return hash
    }
}

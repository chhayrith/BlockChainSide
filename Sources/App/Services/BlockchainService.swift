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
    
    func resolve(completion: @escaping(BlockChain) -> ()) {
        let nodes = self.blockchain.nodes
        for node in nodes {
            let url = URL(string: "\(node.address)/blockchain")!
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data{
                    let blockchain = try! JSONDecoder().decode(BlockChain.self, from: data)
                    
                    if self.blockchain.blocks.count > blockchain.blocks.count{
                        completion(self.blockchain)
                    }else{
                        self.blockchain = blockchain
                        completion(blockchain)
                    }
                }
            }.resume()
        }
    }
    
    func registerNodes(nodes: [BlockchainNode]) -> [BlockchainNode] {
        return self.blockchain.registerNodes(nodes: nodes)
    }
    
    func getBlockchain() -> BlockChain {
        return self.blockchain
    }
    
    func getNodes() -> [BlockchainNode] {
        return self.blockchain.nodes
    }
    
    func getNextBlock(transactions: [Transaction]) -> Block {
        let block = self.blockchain.getNextBlock(transations: transactions)
        self.blockchain.addBlock(block)
        return block
    }
}

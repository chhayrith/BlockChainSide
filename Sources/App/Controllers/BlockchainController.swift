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
    
    func resolve(req: Request) -> EventLoopFuture<BlockChain>{
        let promise: EventLoopPromise<BlockChain> = req.eventLoop.makePromise()
        blockChainService.resolve(completion: { promise.succeed($0) })
        return promise.futureResult
    }
    
    func getBlockchain(req: Request) -> BlockChain {
        return self.blockChainService.getBlockchain()
    }
    
    func registerNodes(req: Request, nodes: [BlockchainNode]) -> [BlockchainNode] {
        return self.blockChainService.registerNodes(nodes: nodes)
    }
    
    func mine(req: Request, transaction: Transaction) -> Block{
        return self.blockChainService.getNextBlock(transactions: [transaction])
    }

    func getNodes(req: Request) -> [BlockchainNode]{
        return blockChainService.getNodes()
    }
}

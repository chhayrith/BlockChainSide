import Vapor

struct InfoResponse: Content {
    let request: InfoData?
}

struct InfoData: Content {
    let name: String
    let age: Int?
    let file: Data?
}

func routes(_ app: Application) throws {
    
    app.get { req async in
        "Wellcome to chhayrith's blockchain research api!!"
    }
    
    
    let blockChainController = BlockchainController()
    app.get("blockchain", use: blockChainController.getBlockchain(req:))
    app.get("nodes", use: blockChainController.getNodes(req:))
    app.get("resolve", use: blockChainController.resolve(req:))
    
    app.post("mine") { req -> Block in
        let transaction = try req.content.decode(Transaction.self)
        let block = blockChainController.mine(req: req, transaction: transaction)
        return block
    }
    
    app.post("nodes", "register") { req -> [BlockchainNode] in
        let nodes = try req.content.decode([BlockchainNode].self)
        return blockChainController.registerNodes(req: req, nodes: nodes)
    }
    
}

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
//    
//    app.post("info") { req -> String in
//        let data = try req.content.decode(InfoData.self)
//        return "Hello \(data.name)!"
//    }
//    
//    app.post("user", "info") { req -> InfoResponse in
//        let data = try req.content.decode(InfoData.self)
//        return InfoResponse(request: data)
//    }

    
    
//    let blockChainController = BlockchainController()
//    app.get("api","greet", use: blockChainController.greet(req:))
//    app.get("blockchain", use: blockChainController.getBlockchain(req:))
}

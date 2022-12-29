//
//  File.swift
//  
//
//  Created by liem on 29/12/22.
//

import Foundation
import Vapor

final class BlockchainNode: Content {
    
    var address: String
    
    init(address: String) {
        self.address = address
    }
}

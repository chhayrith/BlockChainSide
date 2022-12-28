//
//  Encryption.swift
//  SwiftBlockChain
//
//  Created by liem on 26/12/22.
//

import Foundation
import CryptoKit

extension Digest {
    var bytes: [UInt8] { Array(makeIterator()) }
    var data: Data { Data(bytes) }

    var hexStr: String {
        bytes.map { String(format: "%02X", $0) }.joined()
    }
}


extension String{
    func sha1Hash() -> String{
        let task = Process()
        task.launchPath = "/usr/bin/shasum"
        task.arguments = []
        let inputPipe = Pipe()
        inputPipe.fileHandleForWriting.write(self.data(using:String.Encoding.utf8)!)
        inputPipe.fileHandleForWriting.closeFile()
        
        let outputPipe = Pipe()
        task.standardOutput = outputPipe
        task.standardInput = inputPipe
        task.launch()
        let data = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let hash = String (data: data, encoding: String.Encoding.utf8)!
        return hash.replacingOccurrences(of: "  -\n", with: "")
    }
}

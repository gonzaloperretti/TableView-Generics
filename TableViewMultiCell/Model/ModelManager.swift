//
//  ModelManager.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 1/7/21.
//

import Foundation

typealias CompletionHandler = ([ChatItem]) -> Void

protocol Model {
    func fetchInfo(completion: CompletionHandler)
}

class ModelManager: Model {
    let jsonParser: Parser
    
    init(parser: Parser = JsonParser()) {
        jsonParser = parser
    }
    
    func fetchInfo(completion: CompletionHandler) {
        
        jsonParser.parseFile(fileName: "messages", bundle: .main, type: [ChatItem].self) { result in
            completion(result ?? [])
        }
    }
    
}

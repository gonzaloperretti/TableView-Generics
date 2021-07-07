//
//  ModelManager.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 1/7/21.
//

import Foundation

protocol Model {
    func fetchInfo<T: Codable>(type: T.Type, completion: (Result<T, ParsingError>) -> Void)
}

class ModelManager: Model {
    let jsonParser: Parser
    
    init(parser: Parser = JsonParser(dataCollector: LocalDataCollector(
                                        fileName: "messages",
                                        bundle: Bundle.main))) {
        jsonParser = parser
    }
    
    func fetchInfo<T: Codable>(type: T.Type, completion: (Result<T, ParsingError>) -> Void) {
        jsonParser.parse(type: T.self) { result in
            switch result {
            case .success(let objects):
                completion(.success(objects))
            case .failure(let error):
                completion(.failure(.DecodingError(error)))
            }
        }
    }
    
}

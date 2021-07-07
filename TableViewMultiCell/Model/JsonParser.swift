//
//  JsonParser.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 1/7/21.
//

import Foundation

enum ParsingError: Error, Equatable {
    case DataError(Error)
    case DecodingError(Error)
    case SourceNotFound
    
    static func == (lhs: ParsingError, rhs: ParsingError) -> Bool {
        switch (lhs, rhs) {
        case (.DataError, .DataError), (.DecodingError, .DecodingError), (SourceNotFound, SourceNotFound):
            return true
        default:
            return false
        }
    }
    
}

protocol Parser {
    func parseFile<T: Codable>(type: T.Type, completion: (Result<T, ParsingError>) -> Void)
}

class JsonParser: Parser {
    let dataCollector: DataCollector
    
    init(dataCollector: DataCollector) {
        self.dataCollector = dataCollector
    }
    
    func parseFile<T: Codable>(type: T.Type, completion: (Result<T, ParsingError>) -> Void) {
        dataCollector.getData() { result in
            switch result {
            case .success(let data):
                do {
                    let objects = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(objects))
                } catch {
                    completion(.failure(ParsingError.DecodingError(error)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}

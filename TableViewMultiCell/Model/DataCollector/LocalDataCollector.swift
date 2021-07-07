//
//  LocalDataCollector.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 6/7/21.
//

import Foundation

class LocalDataCollector: DataCollector {
    private let fileName: String
    private let bundle: Bundle
    
    init(fileName: String, bundle: Bundle) {
        self.fileName = fileName
        self.bundle = bundle
    }
    
    func getData(completion: (Result<Data, ParsingError>) -> Void) {
        guard let filepath = bundle.path(forResource: fileName, ofType: "json") else {
            completion(.failure(ParsingError.SourceNotFound))
            return
        }
        do {
            completion(.success(try Data(contentsOf: URL(fileURLWithPath: filepath), options: .mappedIfSafe)))
        } catch {
            completion(.failure(.DataError(error)))
        }
    }
}

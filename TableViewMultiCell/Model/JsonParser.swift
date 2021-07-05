//
//  JsonParser.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 1/7/21.
//

import Foundation

protocol Parser {
    func parseFile<T: Codable>(fileName: String, bundle: Bundle, type: T.Type, completion: ((T?) -> Void))
}

class JsonParser: Parser {
    func parseFile<T: Codable>(fileName: String, bundle: Bundle, type: T.Type, completion: ((T?) -> Void)) {
        guard let data = readJsonFile(fileName: fileName, bundle: bundle),
              let objects = try? JSONDecoder().decode(T.self, from: data) else {
            print("Error decoding file using type: \(T.self)")
            completion(nil)
            return
        }
        
        return completion(objects)
    }
    
    private func readJsonFile(fileName: String, bundle: Bundle) -> Data? {
        guard let filepath = bundle.path(forResource: fileName, ofType: "json") else {
            return nil
        }
        return try? Data(contentsOf: URL(fileURLWithPath: filepath), options: .mappedIfSafe)
    }
}

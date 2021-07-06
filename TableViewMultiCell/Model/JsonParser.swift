//
//  JsonParser.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 1/7/21.
//

import Foundation

enum ParsingError: Error {
    case FileError
    case DecodingError
}

protocol Parser {
    func parseFile<T: Codable>(fileName: String, bundle: Bundle, type: T.Type, completion: ((T?) -> Void)) throws
}

class JsonParser: Parser {
    func parseFile<T: Codable>(fileName: String, bundle: Bundle, type: T.Type, completion: ((T?) -> Void)) throws {
        guard let data = readJsonFile(fileName: fileName, bundle: bundle) else {
            print("Error decoding file using type: \(T.self)")
            throw ParsingError.FileError
        }
        guard let objects = try? JSONDecoder().decode(T.self, from: data) else {
            print("Error decoding file using type: \(T.self)")
            throw ParsingError.DecodingError
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

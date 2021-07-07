//
//  DataCollector.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 6/7/21.
//

import Foundation

protocol DataCollector {
    func getData(completion: (Result<Data, ParsingError>) -> Void)
}

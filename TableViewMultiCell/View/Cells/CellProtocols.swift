//
//  Protocols.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 2/7/21.
//

import Foundation

protocol LoadCell {
    associatedtype T
    func configure(using viewModel: T)
}

protocol ViewModel { }

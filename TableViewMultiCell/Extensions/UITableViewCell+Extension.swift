//
//  TableView.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 2/7/21.
//

import Foundation
import UIKit

protocol ReusableCell {
    static var reusableIdentifier: String { get }
}

extension ReusableCell {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

protocol CellConfigurable {
    func configure(viewModel: ViewModel)
}

extension UITableViewCell: CellConfigurable {
    @objc func configure(viewModel: ViewModel) { }
}

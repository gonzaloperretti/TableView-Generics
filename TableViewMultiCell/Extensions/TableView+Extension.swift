//
//  TableView.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 2/7/21.
//

import Foundation
import UIKit

extension UITableView {
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T? where T: ReusableCell {
        return dequeueReusableCell(withIdentifier: T.reusableIdentifier , for: indexPath) as? T
    }
}

//
//  TableView.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 2/7/21.
//

import Foundation
import UIKit

extension UITableView {
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath, for type: T.Type) -> T? where T: ReusableCell {
        return dequeueReusableCell(withIdentifier: String(describing: type) , for: indexPath) as? T
    }
}

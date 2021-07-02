//
//  SenderCell.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 2/7/21.
//

import Foundation
import UIKit

class SenderCell: UITableViewCell, ReusableCell {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
}

extension SenderCell: LoadCell {
    typealias T = SentMessage
    func configure(using viewModel: SentMessage) {
        messageLabel.text = viewModel.text
        timeLabel.text = viewModel.time
    }
}

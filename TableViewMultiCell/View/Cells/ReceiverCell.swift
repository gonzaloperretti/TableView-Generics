//
//  ReceiverCell.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 2/7/21.
//

import Foundation
import UIKit

class ReceiverCell: UITableViewCell, ReusableCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
}


extension ReceiverCell: LoadCell {
    typealias T = ReceivedMessage
    func configure(using viewModel: ReceivedMessage) {
        userNameLabel.text = viewModel.name
        messageLabel.text = viewModel.text
        timeLabel.text = viewModel.time
    }
}

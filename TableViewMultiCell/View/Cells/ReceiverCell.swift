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
    
    override func configure(viewModel: ViewModel) {
        super.configure(viewModel: viewModel)
        let receiverViewModel = viewModel as? ReceivedMessageViewModel
        userNameLabel.text = receiverViewModel?.name
        messageLabel.text = receiverViewModel?.text
        timeLabel.text = receiverViewModel?.time
    }
}

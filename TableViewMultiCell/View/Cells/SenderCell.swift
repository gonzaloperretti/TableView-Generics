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
    
    override func configure(viewModel: ViewModel) {
        super.configure(viewModel: viewModel)
        let senderViewModel = viewModel as? SentMessageViewModel
        messageLabel.text = senderViewModel?.text
        timeLabel.text = senderViewModel?.time
    }
}

//
//  SentMessageViewModel.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 2/7/21.
//

import Foundation

class SentMessageViewModel: ViewModel {
    var text: String
    var time: String
    
    init(item: ChatItem) {
        self.text = item.message
        self.time = item.time
    }
}

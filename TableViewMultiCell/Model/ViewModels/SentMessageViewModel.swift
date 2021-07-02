//
//  SentMessageViewModel.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 2/7/21.
//

import Foundation

protocol SentMessage: ViewModel {
    var text: String { get }
    var time: String { get }
}

struct SentMessageViewModel: SentMessage {
    var text: String
    var time: String
    
    init(item: ChatItem) {
        self.text = item.message
        self.time = item.time
    }
}

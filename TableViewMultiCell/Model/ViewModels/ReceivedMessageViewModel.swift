//
//  ReceivedMessageViewModel.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 2/7/21.
//

import Foundation

protocol ReceivedMessage: ViewModel {
    var name: String { get }
    var text: String { get }
    var time: String { get }
}
    
struct ReceivedMessageViewModel: ReceivedMessage {
    var name: String
    var text: String
    var time: String
    
    init(item: ChatItem) {
        self.name = item.user
        self.text = item.message
        self.time = item.time
    }
}

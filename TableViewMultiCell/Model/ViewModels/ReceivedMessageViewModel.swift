//
//  ReceivedMessageViewModel.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 2/7/21.
//

import Foundation
    
class ReceivedMessageViewModel: ViewModel {
    var name: String
    var text: String
    var time: String
    
    init(item: ChatItem) {
        self.name = item.user
        self.text = item.message
        self.time = item.time
    }
}

//
//  Message.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 1/7/21.
//

import Foundation

struct ChatItem: Codable {
    var user: String
    var message: String
    var time: String
}

extension ChatItem {
    enum CodingKeys: String, CodingKey {
        case user = "username"
        case message
        case time = "timeMessage"
    }
}

//
//  ChatItem+Mock.swift
//  TableViewMultiCellTests
//
//  Created by Gonzalo Perretti on 2/7/21.
//

import Foundation

@testable import TableViewMultiCell

extension ChatItem {
    static func mockData() -> [ChatItem] {
        return [
            ChatItem(user: "User_1", message: "Message_1", time: "time_1"),
            ChatItem(user: "Me", message: "Message_2", time: "time_2"),
            ChatItem(user: "User_3", message: "Message_3", time: "time_3"),
            ChatItem(user: "User_4", message: "Message_4", time: "time_4"),
            ChatItem(user: "User_5", message: "Message_5", time: "time_5")
        ]
    }
}

//
//  TableViewMultiCellTests.swift
//  TableViewMultiCellTests
//
//  Created by Gonzalo Perretti on 1/7/21.
//

import XCTest
@testable import TableViewMultiCell

class TableViewTests: XCTestCase {

    var sut: ChatViewController?
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateInitialViewController() as? ChatViewController
                
        sut?.loadView()
        sut?.loadViewIfNeeded()
    }

    func testTableViewInfo() throws {
        XCTAssertNotNil(sut?.tableView)
        sut?.messages = ChatItem.mockData()
        XCTAssertEqual(sut?.tableView.numberOfRows(inSection: 0), 5)
        let senderCell = sut?.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? SenderCell
        XCTAssertEqual(senderCell?.messageLabel.text, sut?.messages[1].message)
        XCTAssertEqual(senderCell?.timeLabel.text, sut?.messages[1].time)
        let receiverCell = sut?.tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? ReceiverCell
        XCTAssertEqual(receiverCell?.userNameLabel.text, sut?.messages[2].user)
        XCTAssertEqual(receiverCell?.messageLabel.text, sut?.messages[2].message)
        XCTAssertEqual(receiverCell?.timeLabel.text, sut?.messages[2].time)
    }
}

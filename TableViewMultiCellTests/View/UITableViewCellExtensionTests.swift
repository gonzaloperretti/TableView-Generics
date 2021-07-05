//
//  UITableViewCellExtensionTests.swift
//  TableViewMultiCellTests
//
//  Created by Gonzalo Perretti on 5/7/21.
//

import XCTest
@testable import TableViewMultiCell

private struct Constants {
    static let reusableIdentifier = "TestTableViewCell"
}

class UITableViewCellExtensionTests: XCTestCase {

    func testExample() throws {
        XCTAssertEqual(TestTableViewCell.reusableIdentifier, Constants.reusableIdentifier)
    }

}

class TestTableViewCell: ReusableCell {}

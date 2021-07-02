//
//  TableViewMultiCellTests.swift
//  TableViewMultiCellTests
//
//  Created by Gonzalo Perretti on 1/7/21.
//

import XCTest
@testable import TableViewMultiCell

class ParserTests: XCTestCase {

    let sut: Parser = JsonParser()
    let data: [String] = []

    func testParserWithStrings() throws {
        let expectation = XCTestExpectation(description: "Test parse strings")
        sut.parseFile(fileName: "test", bundle: Bundle(for: Self.self), type: [String].self) { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.count, 5)
            XCTAssertEqual(result?[2], "Object_3")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testParserWithChatItem() throws {
        let expectation = XCTestExpectation(description: "Test parse ChatItem")
        sut.parseFile(fileName: "test2", bundle: Bundle(for: Self.self), type: [ChatItem].self) { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.count, 3)
            XCTAssertEqual(result?[1].user, "userName_2")
            XCTAssertEqual(result?[1].message, "message_2")
            XCTAssertEqual(result?[1].time, "timeMessage_2")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}

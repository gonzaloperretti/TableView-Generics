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
    
    func testParserWithStrings() throws {
        let expectation = XCTestExpectation(description: "Test parse strings")
        do {
            try sut.parseFile(fileName: "test", bundle: Bundle(for: Self.self), type: [String].self) { result in
                XCTAssertNotNil(result)
                XCTAssertEqual(result?.count, 5)
                XCTAssertEqual(result?[2], "Object_3")
                expectation.fulfill()
            }
        } catch {
            XCTFail("Failed")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testParserWithChatItem() throws {
        let expectation = XCTestExpectation(description: "Test parse ChatItem")
        do {
            try sut.parseFile(fileName: "test2", bundle: Bundle(for: Self.self), type: [ChatItem].self) { result in
                XCTAssertNotNil(result)
                XCTAssertEqual(result?.count, 3)
                XCTAssertEqual(result?[1].user, "userName_2")
                XCTAssertEqual(result?[1].message, "message_2")
                XCTAssertEqual(result?[1].time, "timeMessage_2")
                expectation.fulfill()
            }
        } catch {
            XCTFail("Failed")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testParseMissingFile() throws {
        let expectation = XCTestExpectation(description: "File not found")
        do {
            try sut.parseFile(fileName: "testMissingFile", bundle: Bundle(for: Self.self), type: [String].self) { result in
                XCTFail("Failed")
                expectation.fulfill()
            }
        } catch let error {
            XCTAssertEqual(error as? ParsingError, ParsingError.FileError)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testParseInvalidFile() throws {
        let expectation = XCTestExpectation(description: "Error decoding")
        do {
            try sut.parseFile(fileName: "wrongFile", bundle: Bundle(for: Self.self), type: [String].self) { result in
                XCTFail("Failed")
                expectation.fulfill()
            }
        } catch let error {
            XCTAssertEqual(error as? ParsingError, ParsingError.DecodingError)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testParseEmptyFile() throws {
        let expectation = XCTestExpectation(description: "Empty file")
        do {
            try sut.parseFile(fileName: "emptyFile", bundle: Bundle(for: Self.self), type: [String].self) { result in
                XCTAssertEqual(result, [])
                expectation.fulfill()
            }
        } catch {
            XCTFail("Failed")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
}

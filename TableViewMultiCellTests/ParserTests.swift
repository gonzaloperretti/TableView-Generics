//
//  TableViewMultiCellTests.swift
//  TableViewMultiCellTests
//
//  Created by Gonzalo Perretti on 1/7/21.
//

import XCTest
@testable import TableViewMultiCell

class ParserTests: XCTestCase {
    
    var sut: Parser!
    
    func testParserWithStrings() throws {
        sut = JsonParser(dataCollector: LocalDataCollector(fileName: "test", bundle: Bundle(for: Self.self)))
        let expectation = XCTestExpectation(description: "Test parse strings")
        sut.parseFile(type: [String].self) { result in
            switch result {
            case .success(let objects):
                XCTAssertNotNil(objects)
                XCTAssertEqual(objects.count, 5)
                XCTAssertEqual(objects[2], "Object_3")
                expectation.fulfill()
            case .failure:
                XCTFail("Failed")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testParserWithChatItem() throws {
        sut = JsonParser(dataCollector: LocalDataCollector(fileName: "test2", bundle: Bundle(for: Self.self)))
        let expectation = XCTestExpectation(description: "Test parse ChatItem")
        sut.parseFile(type: [ChatItem].self) { result in
            switch result {
            case .success(let objects):
                XCTAssertNotNil(objects)
                XCTAssertEqual(objects.count, 3)
                XCTAssertEqual(objects[1].user, "userName_2")
                XCTAssertEqual(objects[1].message, "message_2")
                XCTAssertEqual(objects[1].time, "timeMessage_2")
                expectation.fulfill()
            case .failure:
                XCTFail("Failed")
            }
            
            wait(for: [expectation], timeout: 5)
        }
    }
    
    func testParseMissingFile() throws {
        sut = JsonParser(dataCollector: LocalDataCollector(fileName: "testMissingFile", bundle: Bundle(for: Self.self)))
        let expectation = XCTestExpectation(description: "File not found")
        sut.parseFile(type: [String].self) { result in
            switch result {
            case .success:
                XCTFail("Failed")
            case .failure(let error):
                XCTAssertEqual(error, ParsingError.SourceNotFound)
                expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 5)
        }
    }
//
//        func testParseInvalidFile() throws {
//            let expectation = XCTestExpectation(description: "Error decoding")
//            do {
//                try sut.parseFile(fileName: "wrongFile", bundle: Bundle(for: Self.self), type: [String].self) { result in
//                    XCTFail("Failed")
//                    expectation.fulfill()
//                }
//            } catch let error {
//                XCTAssertEqual(error as? ParsingError, ParsingError.DecodingError)
//                expectation.fulfill()
//            }
//
//            wait(for: [expectation], timeout: 5)
//        }
//
//        func testParseEmptyFile() throws {
//            let expectation = XCTestExpectation(description: "Empty file")
//            do {
//                try sut.parseFile(fileName: "emptyFile", bundle: Bundle(for: Self.self), type: [String].self) { result in
//                    XCTAssertEqual(result, [])
//                    expectation.fulfill()
//                }
//            } catch {
//                XCTFail("Failed")
//                expectation.fulfill()
//            }
//
//            wait(for: [expectation], timeout: 5)
//        }
//
//     }
}

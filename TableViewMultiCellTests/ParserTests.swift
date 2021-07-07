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
        sut.parse(type: [String].self) { result in
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
        sut.parse(type: [ChatItem].self) { result in
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
        sut.parse(type: [String].self) { result in
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
    
    
    func testCustomSuccessDataCollector() throws {
        sut = JsonParser(dataCollector: CustomSuccessDataCollector())
        let expectation = XCTestExpectation(description: "Custom Success Data Collector")
        sut.parse(type: [String].self) { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data[0], "Test Data")
                expectation.fulfill()
            case .failure:
                XCTFail("Failed")
            }
            
            wait(for: [expectation], timeout: 5)
        }
    }
    
    func testCustomFailDataCollector() throws {
        sut = JsonParser(dataCollector: CustomFailDataCollector())
        let expectation = XCTestExpectation(description: "Custom Fail Data Collector")
        sut.parse(type: [String].self) { result in
            switch result {
            case .success:
                XCTFail("Failed")
            case .failure(let error):
                XCTAssertEqual(error, ParsingError.DataError(NSError()))
                expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 5)
        }
    }
}

class CustomSuccessDataCollector: DataCollector {
    func getData(completion: (Result<Data, ParsingError>) -> Void) {
        completion(.success(Data("[\"Test Data\"]".utf8)))
    }
}

class CustomFailDataCollector: DataCollector {
    func getData(completion: (Result<Data, ParsingError>) -> Void) {
        completion(.failure(.DataError(NSError())))
    }
}

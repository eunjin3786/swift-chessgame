//
//  SwiftChessGameTests.swift
//  SwiftChessGameTests
//
//  Created by iwill.h on 2022/06/20.
//

import XCTest
@testable import SwiftChessGame

class SwiftChessGameTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPosition()  {
        let a1 = Position(value: "A1")
        XCTAssertNotNil(a1)
        XCTAssertTrue(a1?.rank == 0 && a1?.file == 0)
        
        let a7 = Position(value: "H8")
        XCTAssertNotNil(a7)
        XCTAssertTrue(a7?.rank == 7 && a7?.file == 7)
        
        let z4 = Position(value: "Z4")
        XCTAssertNil(z4)
        
        let unknown = Position(value: "Hello World")
        XCTAssertNil(unknown)
    }
}

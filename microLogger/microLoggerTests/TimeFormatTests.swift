//
//  TimeFormatTests.swift
//  microLoggerTests
//
//  Created by Miroslav Sliacky on 18/03/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import XCTest
@testable import MicroLogger

class TimeFormatTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
        // reset any time format
        MLogger.logDateFormat = nil
    }
    
    func testDefaultTimeFormat() {
        let date = Date(timeIntervalSince1970: 1521369031)
        MLogger.formatter.timeZone = TimeZone(abbreviation: "CET")
        
        let timestamp = MLogger.formatedTimestamp(from: date)
        XCTAssertEqual(timestamp, "18.03.2018 | 11:30:31.000")
    }
    
    func testSystemTimeFormat() {
        MLogger.logDateFormat = "yyyy-MM-dd HH:mm:ss Z" // get default system dateFormat
        
        let date = Date(timeIntervalSince1970: 1521369031)
        MLogger.formatter.timeZone = TimeZone(abbreviation: "CET")
        
        let timestamp = MLogger.formatedTimestamp(from: date)
        XCTAssertEqual(timestamp, "2018-03-18 11:30:31 +0100")
    }
    
}

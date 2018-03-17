//
//  microLoggerTests.swift
//  microLoggerTests
//
//  Created by Miroslav Sliacky on 17/03/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import XCTest
@testable import MicroLogger

class microLoggerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        MLogger.logLevel = .verbose
        
        XCTAssertTrue(MLogger.canLog(forLevel: .debug))
    }
    
}

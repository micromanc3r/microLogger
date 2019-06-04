//
//  MicroLoggerTests.swift
//  microLoggerTests
//
//  Created by Miroslav Sliacky on 17/03/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import XCTest
@testable import MicroLogger

class MLogLevelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testVerbose() {
        MLogger.logLevel = .verbose
        
        XCTAssertTrue(MLogger.canLog(level: .verbose))
        XCTAssertTrue(MLogger.canLog(level: .debug))
        XCTAssertTrue(MLogger.canLog(level: .warning))
        XCTAssertTrue(MLogger.canLog(level: .error))
    }
    
    func testDebug() {
        MLogger.logLevel = .debug
        
        XCTAssertFalse(MLogger.canLog(level: .verbose))
        XCTAssertTrue(MLogger.canLog(level: .debug))
        XCTAssertTrue(MLogger.canLog(level: .warning))
        XCTAssertTrue(MLogger.canLog(level: .error))
    }
    
    func testWarning() {
        MLogger.logLevel = .warning
        
        XCTAssertFalse(MLogger.canLog(level: .verbose))
        XCTAssertFalse(MLogger.canLog(level: .debug))
        XCTAssertTrue(MLogger.canLog(level: .warning))
        XCTAssertTrue(MLogger.canLog(level: .error))
    }
    
    func testError() {
        MLogger.logLevel = .error
        
        XCTAssertFalse(MLogger.canLog(level: .verbose))
        XCTAssertFalse(MLogger.canLog(level: .debug))
        XCTAssertFalse(MLogger.canLog(level: .warning))
        XCTAssertTrue(MLogger.canLog(level: .error))
    }
    
}

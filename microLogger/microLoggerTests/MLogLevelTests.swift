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
        
        XCTAssertTrue(MLogger.canLog(forLevel: .verbose))
        XCTAssertTrue(MLogger.canLog(forLevel: .debug))
        XCTAssertTrue(MLogger.canLog(forLevel: .warning))
        XCTAssertTrue(MLogger.canLog(forLevel: .error))
    }
    
    func testDebug() {
        MLogger.logLevel = .debug
        
        XCTAssertFalse(MLogger.canLog(forLevel: .verbose))
        XCTAssertTrue(MLogger.canLog(forLevel: .debug))
        XCTAssertTrue(MLogger.canLog(forLevel: .warning))
        XCTAssertTrue(MLogger.canLog(forLevel: .error))
    }
    
    func testWarning() {
        MLogger.logLevel = .warning
        
        XCTAssertFalse(MLogger.canLog(forLevel: .verbose))
        XCTAssertFalse(MLogger.canLog(forLevel: .debug))
        XCTAssertTrue(MLogger.canLog(forLevel: .warning))
        XCTAssertTrue(MLogger.canLog(forLevel: .error))
    }
    
    func testError() {
        MLogger.logLevel = .error
        
        XCTAssertFalse(MLogger.canLog(forLevel: .verbose))
        XCTAssertFalse(MLogger.canLog(forLevel: .debug))
        XCTAssertFalse(MLogger.canLog(forLevel: .warning))
        XCTAssertTrue(MLogger.canLog(forLevel: .error))
    }
    
}

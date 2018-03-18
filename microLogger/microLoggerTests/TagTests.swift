//
//  TagTests.swift
//  microLoggerTests
//
//  Created by Miroslav Sliacky on 18/03/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import XCTest
@testable import MicroLogger
import Foundation

class TagTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTag() {
        let test: UIView? = nil
        let fallbackTag = MLogger.tag(from: test as Any)
        XCTAssertEqual(fallbackTag, "MicroLogger.MLogger")
        
        let instanceTag = MLogger.tag(from: UIView())
        XCTAssertEqual(instanceTag, "UIView")
        
        let classTag = MLogger.tag(from: UIView.self)
        XCTAssertEqual(classTag, "UIView")
    }
    
}

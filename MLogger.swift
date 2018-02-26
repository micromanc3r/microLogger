//
//  MLogger.swift
//  micromanc3r
//
//  Created by Miroslav Sliacky on 26/02/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import UIKit

enum MLogLevel: Int {
    case logLevelVerbose = 0
    case logLevelDebug = 1
    case logLevelWarning = 2
    case logLevelError = 3
}

class MLogger {
    
    private static let verboseTag = "VERBOSE"
    private static let debugTag = "DEBUG"
    private static let warningTag = "WARNING"
    private static let errorTag = "ERROR"
    
    static var logLevel: MLogLevel = .logLevelError
    
    ////////////////////////////////
    // MARK: - public log methods
    class func logVerbose(sender: Any, andMessage logMessage: String ) {
        if MLogger.logLevel.rawValue <= MLogLevel.logLevelVerbose.rawValue {
            self.internalLogWithLevel(lvlTag: verboseTag,
                                      tag: tagFrom(sender: sender),
                                      logMessage: logMessage)
        }
    }
    
    class func logDebug(sender: Any, andMessage logMessage: String ) {
        if MLogger.logLevel.rawValue <= MLogLevel.logLevelDebug.rawValue {
            self.internalLogWithLevel(lvlTag: debugTag,
                                      tag: tagFrom(sender: sender),
                                      logMessage: logMessage)
        }
    }
    
    class func logWarning(sender: Any, andMessage logMessage: String ) {
        if MLogger.logLevel.rawValue <= MLogLevel.logLevelWarning.rawValue {
            self.internalLogWithLevel(lvlTag: warningTag,
                                      tag: tagFrom(sender: sender),
                                      logMessage: logMessage)
        }
    }
    
    class func logError(sender: Any, andMessage logMessage: String ) {
        if MLogger.logLevel.rawValue <= MLogLevel.logLevelError.rawValue {
            self.internalLogWithLevel(lvlTag: errorTag,
                                      tag: tagFrom(sender: sender),
                                      logMessage: logMessage)
        }
    }
    
    ////////////////////////////////
    // MARK: - Private methods
    private class func internalLogWithLevel(lvlTag: String, tag: String, logMessage: String) {
        print("|", lvlTag, "|", tag, "|", logMessage)
    }
    
    private class func tagFrom(sender: Any) -> String {
        return NSStringFromClass((type(of: sender) as? AnyClass) ?? sender as? AnyClass ?? MLogger.self)
    }
    
}

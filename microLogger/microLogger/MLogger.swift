//
//  MLogger.swift
//  micromanc3r
//
//  Created by Miroslav Sliacky on 26/02/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation

public enum MLogLevel: Int {
    case verbose    = 0
    case debug      = 1
    case warning    = 2
    case error      = 3
}

public class MLogger {
    
    static let verboseTag   = "=VERBOSE="
    static let debugTag     = "==DEBUG=="
    static let warningTag   = "=WARNING="
    static let errorTag     = "==ERROR=="
    
    static let microDateFormat = "dd.MM.yyyy | HH:mm:ss.SSS"
    static let formatter = DateFormatter()
    
    public static var logLevel: MLogLevel = .error
    public static var logDateFormat: String?
    
    ////////////////////////////////
    // MARK: - public log methods
    public class func logVerbose(sender: Any, andMessage message: String) {
        guard canLog(forLevel: .verbose) else {
            return
        }
        
        self.microLog(withLevel: verboseTag,
                      sender: sender,
                      message: message)
    }
    
    public class func logDebug(sender: Any, andMessage message: String) {
        guard canLog(forLevel: .debug) else {
            return
        }
        
        self.microLog(withLevel: debugTag,
                      sender: sender,
                      message: message)
    }
    
    public class func logWarning(sender: Any, andMessage message: String) {
        guard canLog(forLevel: .warning) else {
            return
        }
        
        self.microLog(withLevel: warningTag,
                      sender: sender,
                      message: message)
    }
    
    public class func logError(sender: Any, andMessage message: String) {
        guard canLog(forLevel: .error) else {
            return
        }
        
        self.microLog(withLevel: errorTag,
                      sender: sender,
                      message: message)
    }
    
    ////////////////////////////////
    // MARK: - Private methods
    class func canLog(forLevel level: MLogLevel) -> Bool {
        return logLevel.rawValue <= level.rawValue
    }
    
    class func microLog(withLevel lvlTag: String, sender: Any, message: String) {
        let stringTag = tag(from: sender)
        print(formatedTimestamp(), "|", lvlTag, "|", stringTag, "|", message)
    }
    
    class func formatedTimestamp() -> String {
        return formatedTimestamp(from: Date())
    }
    
    class func formatedTimestamp(from date: Date) -> String {
        formatter.dateFormat = logDateFormat ?? microDateFormat
        return formatter.string(from: date)
    }
    
    class func tag(from sender: Any) -> String {
        return NSStringFromClass((type(of: sender) as? AnyClass) ?? sender as? AnyClass ?? MLogger.self)
    }
    
}

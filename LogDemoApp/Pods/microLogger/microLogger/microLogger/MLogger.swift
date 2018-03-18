//
//  MLogger.swift
//  micromanc3r
//
//  Created by Miroslav Sliacky on 26/02/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation

public enum MLogLevel: Int { //treba prefixy?
    case verbose = 0
    case debug = 1
    case warning = 2
    case error = 3
}

public class MLogger {
    
    private static let verboseTag = "VERBOSE"
    private static let debugTag = "DEBUG"
    private static let warningTag = "WARNING"
    private static let errorTag = "ERROR"
    
    private static let microTimeFormat = "dd.MM.yyyy | HH:mm:ss.SSS"
    private static let formatter = DateFormatter()
    
    public static var logLevel: MLogLevel = .error
    public static var logTimeFormat: String?
    
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
        let stringTag = tagFrom(sender: sender)
        print(formatedTimestamp(), "|", lvlTag, "|", stringTag, "|", message)
    }
    
    class func formatedTimestamp() -> String {
        formatter.dateFormat = logTimeFormat ?? microTimeFormat
        return formatter.string(from: Date())
    }
    
    class func tagFrom(sender: Any) -> String {
        return NSStringFromClass((type(of: sender) as? AnyClass) ?? sender as? AnyClass ?? MLogger.self)
    }
    
}

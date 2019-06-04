//
//  MLogger.swift
//  micromanc3r
//
//  Created by Miroslav Sliacky on 26/02/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation
import os.log

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
    
    static var file1: UnsafeMutablePointer<FILE>!
    static var file2: UnsafeMutablePointer<FILE>!
    
    public static var logLevel: MLogLevel = .error
    public static var logDateFormat: String?
    public static var logFileName: String = "/application_log.txt"
    
    ////////////////////////////////
    // MARK: - public log methods
    public class func logVerbose(sender: Any, andMessage message: String) {
        guard canLog(level: .verbose) else {
            return
        }
        
        self.microLog(withLevel: verboseTag,
                      sender: sender,
                      message: message)
    }
    
    public class func logDebug(sender: Any, andMessage message: String) {
        guard canLog(level: .debug) else {
            return
        }
        
        self.microLog(withLevel: debugTag,
                      sender: sender,
                      message: message)
    }
    
    public class func logWarning(sender: Any, andMessage message: String) {
        guard canLog(level: .warning) else {
            return
        }
        
        self.microLog(withLevel: warningTag,
                      sender: sender,
                      message: message)
    }
    
    public class func logError(sender: Any, andMessage message: String) {
        guard canLog(level: .error) else {
            return
        }
        
        self.microLog(withLevel: errorTag,
                      sender: sender,
                      message: message)
    }
    
    ////////////////////////////////
    // MARK: - Redirect logs to document
    public class func redirectLogToDocuments() {
        let allPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                           FileManager.SearchPathDomainMask.userDomainMask,
                                                           true)
        if let documentsDirectory = allPaths.first {
            let pathForLog = documentsDirectory + logFileName
            file1 = freopen(pathForLog.cString(using: String.Encoding.ascii), "a+", stderr)
            file2 = freopen(pathForLog.cString(using: String.Encoding.ascii), "a+", stdout)
        }
    }
    
    public class func stopRedirectLogToDocuments() {
        fclose(file1)
        fclose(file2)
    }
    
    ////////////////////////////////
    // MARK: - Private methods
    class func canLog(level: MLogLevel) -> Bool {
        return logLevel.rawValue <= level.rawValue
    }
    
    class func microLog(withLevel lvlTag: String, sender: Any, message: String) {
        let stringTag = tag(from: sender)
        let osLog = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "microLogger", category: stringTag)
        os_log("%{PUBLIC}@ | %{PUBLIC}@", log: osLog, type: .debug, lvlTag, message)
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

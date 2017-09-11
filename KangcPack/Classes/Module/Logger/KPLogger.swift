//
//  KPLogger.swift
//  KPSDKEx
//
//  Created by Chans on 2017. 9. 7..
//  Copyright © 2017년 KangC. All rights reserved.
//

import Foundation

public enum kPLogType: String {
    case none       = ""
    case debug      = "[DEBUG] "
    case network    = "[NETWORK] "
    case warning    = "[WARNING] "
    case error      = "[ERROR] "
}

public var KPLog = kPLogger.shared
public func KPLog<T>(_ log: T?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    KPLog.type = .debug
    KPLog.output(log, file, function, line)
}

public class kPLogger {
    fileprivate static let shared: kPLogger = {
        return kPLogger()
    }()
    
    public var enable = true
    public var type: kPLogType = kPLogType.none
    
    public func system<T>(_ log: T?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        KPLog.type = .none
        output(log, file, function, line)
    }
    public func d<T>(_ log: T?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        KPLog.type = .debug
        output(log, file, function, line)
    }
    public func n<T>(_ log: T?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        KPLog.type = .network
        output(log, file, function, line)
    }
    public func w<T>(_ log: T?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        KPLog.type = .warning
        output(log, file, function, line)
    }
    public func e<T>(_ log: T?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        KPLog.type = .error
        output(log, file, function, line)
    }
    
    fileprivate func output<T>(_ log: T?, _ file: String, _ function: String, _ line: Int) {
        if KPLog.enable == true {
            let filename = file.lastPathComponent?.deletingPathExtension
            let type = KPLog.type.rawValue
            if let value = log {
                print(" \(filename!).\(function) <\(line)> : \(type)\(value)" ,terminator: "\n")
            }
            else {
                print(" \(filename!).\(function) <\(line)> : \(type) nil" ,terminator: "\n")
            }
        }
    }
}

public extension kPLogger {
    
    public func error(_ e: Error, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        KPLog.type = .error
        output(e, file, function, line)
    }
    
    // To be continue
    
    private func request(_ r: URLRequest) { }
    
    private func response(_ r: URLResponse) { }
    
    private func networkFailed() { }
    
    private func apiFailed() { }
}


//
//  DateExtentions.swift
//  KPSDKEx
//
//  Created by Chans on 2017. 9. 7..
//  Copyright © 2017년 KangC. All rights reserved.
//

import Foundation

extension Date {
    
    // MARK: Simple Formatter
    public static var formatter: DateFormatter {
        return DateFormatter()
    }
    
    // MARK: Convert from String
    public static func fromString(dateString: String, format: String) -> Date{
        let formatter = Date.formatter
        formatter.dateFormat = format
        return formatter.date(from: dateString)!
    }
    // MARK: Convert to String
    
    public func toString(format: String) -> String {
        let formatter = Date.formatter
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    public func year() -> Int { return 0 }
    public func month() -> Int { return 0 }
    public func week() -> Int { return 0 }
}

public extension DateFormatter {}

public extension Calendar {}

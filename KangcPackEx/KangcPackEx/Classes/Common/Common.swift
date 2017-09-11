//
//  Common.swift
//  KangcPackEx
//
//  Created by Chans on 2017. 9. 11..
//  Copyright © 2017년 KangC. All rights reserved.
//

import Foundation
import KangcPack



// using var
public var Log = KPLog

// using func
public func Log<T>(_ log: T?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    KPLog(log, file, function, line)
}

public class Common: NSObject {
    
    public static var app = App.self    
    
    public class func topViewController() -> UIViewController? {
        return KPTopViewController()
    }
    
}



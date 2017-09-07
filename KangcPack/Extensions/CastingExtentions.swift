//
//  CommonExtentions.swift
//  KPSDKEx
//
//  Created by Chans on 2017. 9. 6..
//  Copyright © 2017년 KangC. All rights reserved.
//

import Foundation
import CoreGraphics

/// Int, Float, CGFloat, Double, String
/// extension Int           { }
/// extension CGFloat       { }
/// extension Float         { }
/// extension Double        { }
/// extension String        { }

/// self -> Int value
public extension CGFloat    { public var int: Int { return Int(self) } }
public extension Float      { public var int: Int { return Int(self) } }
public extension Double     { public var int: Int { return Int(self) } }
public extension String     {
    public var int: Int? {
        if let floatValue = self.float { return Int(floatValue) }
        else { return nil } } }


/// self -> CGFloat value
public extension Int        { public var cgfloat: CGFloat { return CGFloat(self) } }
public extension Float      { public var cgfloat: CGFloat { return CGFloat(self) } }
public extension Double     { public var cgfloat: CGFloat { return CGFloat(self) } }
public extension String     {
    public var cgfloat: CGFloat? {
        if let floatValue = Float(self) {
            return CGFloat(floatValue)
        }
        else {
            return nil
        }
    }
}


/// self -> String value
public extension Int        { public var str: String { return "\(self)" } }
public extension CGFloat    { public var str: String { return "\(self)" } }
public extension Float      { public var str: String { return "\(self)" } }
public extension Double     { public var str: String { return "\(self)" } }


/// self -> Float value
public extension Int        { public var float: Float { return Float(self) } }
public extension CGFloat    { public var float: Float { return Float(self) } }
public extension Double     { public var float: Float { return Float(self) } }
public extension String     { public var float: Float? { return Float(self) } }


/// self -> Double value
public extension Int        { public var double: Double { return Double(self) } }
public extension CGFloat    { public var double: Double { return Double(self) } }
public extension Float      { public var double: Double { return Double(self) } }
public extension String     { public var double: Double? { return Double(self) } }


/// self -> NSNumber // used -
public extension Int        { public var number: NSNumber { return NSNumber(value: self) } }
public extension CGFloat    { public var number: NSNumber { return NSNumber(value: self.float) } }
public extension Float      { public var number: NSNumber { return NSNumber(value: self) } }
public extension Double     { public var number: NSNumber { return NSNumber(value: self) } }
public extension String     { public var number: NSNumber? { return NumberFormatter().number(from: self) } }



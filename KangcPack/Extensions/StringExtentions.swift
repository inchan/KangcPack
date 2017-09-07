//
//  StringExtentions.swift
//  KPSDKEx
//
//  Created by Chans on 2017. 9. 6..
//  Copyright © 2017년 KangC. All rights reserved.
//

import Foundation

/// Encoded
public extension String {
    
    // MARK: URL Encoding
    public var urlEncoded: String? {
        let characterSet = NSCharacterSet(charactersIn: "\n ;:\\@&=+$,/?%#[]|\"<>").inverted
        return addingPercentEncoding(withAllowedCharacters: characterSet)
    }
    
    public var urlDecoded: String? {
        return removingPercentEncoding
    }
    
    
    // MARK: Base 64
    public var base64Encoded: String? {
        return data(using: .utf8, allowLossyConversion: true)?.base64EncodedString(options: [])
    }
    
    public var base64Decoded: String? {
        guard let data = Data(base64Encoded: self, options: []) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}


/// Localized
public extension String {
    
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    public func localized(withComment:String = "") -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: withComment)
    }
    
}


/// 귀찮은거 모두
extension String {
    
    public func indexOf(string: String) -> Int? {
        guard let range = range(of: string) else { return nil }
        return characters.distance(from: startIndex, to: range.lowerBound)
    }

    
    public func trim(_ set: CharacterSet = CharacterSet.whitespaces) -> String {
        return trimmingCharacters(in: set)
    }
    
    public subscript (range: Range<Int>) -> String? {
        let count = characters.count
        
        //Check for out of boundary condition
        if count < range.upperBound || count < range.lowerBound { return nil }
        
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return self[start..<end]
    }
    
}

import UIKit

// Text Util
extension String {
    
    public func numberOfLines(size: CGSize, font: UIFont) -> Int {
        let storage = NSTextStorage(string: self, attributes: [NSFontAttributeName: font])
        let container = NSTextContainer(size: size)
        container.lineBreakMode = .byWordWrapping
        container.maximumNumberOfLines = 0
        container.lineFragmentPadding = 0
        
        let manager = NSLayoutManager()
        manager.textStorage = storage
        manager.addTextContainer(container)
        
        var numberOfLines = 0
        var index = 0
        var lineRange = NSRange(location: 0, length: 0)
        
        while index < manager.numberOfGlyphs {
            manager.lineFragmentRect(forGlyphAt: index, effectiveRange: &lineRange)
            index = NSMaxRange(lineRange)
            numberOfLines += 1
        }
        
        return numberOfLines
    }
}

// NS 

extension String {
    
    public var ns: NSString {
        return self as NSString
    }
    
    public func nsRangeOf(string: String) -> NSRange {
        return (self as NSString).range(of: string)
    }

    public var pathExtension: String? {
        return ns.pathExtension
    }
    
    public var lastPathComponent: String? {
        return ns.lastPathComponent
    }
    
    public var deletingLastPathComponent: String {
        return ns.deletingLastPathComponent
    }
    
    public var deletingPathExtension: String {
        return ns.deletingPathExtension
    }
    
    public func appendingPathComponent(path: String) -> String {
        return ns.appendingPathComponent(path)
    }
    
    public func appendingPathExtension(ext: String) -> String? {
        return ns.appendingPathExtension(ext)
    }

}


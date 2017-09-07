//
//  ExtentionsTests.swift
//  ExtentionsTests
//
//  Created by Chans on 2017. 9. 6..
//  Copyright © 2017년 KangC. All rights reserved.
//
//  참고 URL - http://seorenn.blogspot.kr/2014/08/xcode-6-unit-test.html

import XCTest
import KangcPack

class ExtentionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct resultsz
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

// Casting
extension ExtentionsTests {

    func testCasting() {
        
        /// String
        
        // 1. 정수
        self.string("1")
        // 2. 실수
        self.string("1.0")
        // 3. 문자열 -> nil 반환 == 참
        self.string("String Test")
        // 4. 빈값
        self.string("")
        
        /// Int
        // 1. 정수
        self.int(10)
        // 2. 0
        self.int(0)
        // 3. 8자리
        self.int(12345678)
        
        
        /// CGFloat
        // 1. 정수
        self.cgfloat(10)
        // 2. 실수
        self.cgfloat(10.01)
        // 3. 8자리
        self.cgfloat(12345678)
        
        
        /// Float
        // 1. 정수
        self.float(10)
        // 2. 실수
        self.float(10.01)
        // 3. 8자리
        self.float(12345678)
        
        
        /// Double
        // 1. 정수
        self.double(10)
        // 2. 실수
        self.double(10.01)
        // 3. 8자리
        self.double(12345678)
        
    }
    
    private func string(_ v: String) {
        
        if let number = Float(v), v.isEmpty == false {
            XCTAssert(v.int == Int(number))
            XCTAssert(v.cgfloat == CGFloat(number))
            XCTAssert(v.float == Float(number))
            XCTAssert(v.double == Double(number))
            XCTAssert(v.number == NSNumber(value: number))
        }
        else {
            XCTAssertNil(v.int)
            XCTAssertNil(v.cgfloat)
            XCTAssertNil(v.float)
            XCTAssertNil(v.double)
            XCTAssertNil(v.number)
        }
    }
    
    private func int(_ i: Int) {
        
        XCTAssert(i.cgfloat == CGFloat(i))
        XCTAssert(i.float == Float(i))
        XCTAssert(i.double == Double(i))
        XCTAssert(i.number == NSNumber(value: i))
        XCTAssert(i.str == "\(i)")
        
    }
    
    
    private func cgfloat(_ f: CGFloat) {
        
        XCTAssert(f.int == Int(f))
        XCTAssert(f.float == Float(f))
        XCTAssert(f.double == Double(f))
        XCTAssert(f.number == NSNumber(value: f.float))
        XCTAssert(f.str == "\(f)")
        
    }
    
    
    private func float(_ f: Float) {
        
        XCTAssert(f.int == Int(f))
        XCTAssert(f.cgfloat == CGFloat(f))
        XCTAssert(f.double == Double(f))
        XCTAssert(f.number == NSNumber(value: f))
        XCTAssert(f.str == "\(f)")
        
    }
    
    private func double(_ d: Double) {
        
        XCTAssert(d.int == Int(d))
        XCTAssert(d.cgfloat == CGFloat(d))
        XCTAssert(d.float == Float(d))
        XCTAssert(d.number == NSNumber(value: d))
        XCTAssert(d.str == "\(d)")
        
    }
}


// String 
extension ExtentionsTests {
    
    func testEncoding() {
        
        let testString = "testString1234!@#$5678%^&*abcd테스트문자열+_- 공백"
        
        let base64Endcoded = testString.base64Encoded
        XCTAssert(base64Endcoded == "dGVzdFN0cmluZzEyMzQhQCMkNTY3OCVeJiphYmNk7YWM7Iqk7Yq466y47J6Q7Je0K18tIOqzteuwsQ==")

        let urlEncoded = base64Endcoded?.urlEncoded
        XCTAssert(urlEncoded == "dGVzdFN0cmluZzEyMzQhQCMkNTY3OCVeJiphYmNk7YWM7Iqk7Yq466y47J6Q7Je0K18tIOqzteuwsQ%3D%3D")
        
        let urlDecoded = urlEncoded?.urlDecoded
        XCTAssert(urlDecoded == base64Endcoded)
        
        let base64Decoded = urlDecoded?.base64Decoded
        XCTAssert(base64Decoded == testString)
        
    }
    
    func testTrim() {
        
        // Default only whitespaces
        let testString1 = "뒤에공백이 있어요!!!                                    "
        XCTAssert(testString1.trim() == "뒤에공백이 있어요!!!")
        
        // Optional whitespaces and newlines
        let testString2 = "뒤에공백이 있어요!!!                                       \n \t  \n"
        XCTAssert(testString2.trim(CharacterSet.whitespacesAndNewlines) == "뒤에공백이 있어요!!!")

    }
    
    
    func testNSString() {
        
        let testString = "Test String !!"
        
        // Convert to NSStirng
        XCTAssertNotNil(testString.ns)

        // Range Of
        let range = testString.nsRangeOf(string: "String")
        let result = NSRange(location: 5, length: 6)
        XCTAssert(range.location == result.location && range.length == result.length)
        
        // Path
        let testPath = "/Users/chans/Downloads/2017-09-04-17-45-19_Photo_75.jpeg"
        
        XCTAssert(testPath.pathExtension                == "jpeg")
        XCTAssert(testPath.lastPathComponent            == "2017-09-04-17-45-19_Photo_75.jpeg")

        XCTAssert(testPath.deletingLastPathComponent    == "/Users/chans/Downloads")
        XCTAssert(testPath.deletingPathExtension        == "/Users/chans/Downloads/2017-09-04-17-45-19_Photo_75")
        
        XCTAssert(testPath.deletingPathExtension.appendingPathComponent(path: "testPath") == "/Users/chans/Downloads/2017-09-04-17-45-19_Photo_75/testPath")
        XCTAssert(testPath.deletingPathExtension.appendingPathExtension(ext: "png") == "/Users/chans/Downloads/2017-09-04-17-45-19_Photo_75.png")
        XCTAssert(testPath.appendingPathExtension(ext: "jpg") == "/Users/chans/Downloads/2017-09-04-17-45-19_Photo_75.jpeg.jpg")

    }
}

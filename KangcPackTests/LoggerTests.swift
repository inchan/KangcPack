//
//  LoggerTests.swift
//  KangcPack
//
//  Created by Chans on 2017. 9. 8..
//  Copyright © 2017년 KangC. All rights reserved.
//

import XCTest
@testable import KangcPack

class LoggerTests: XCTestCase {
    
    func testLogger() {
     
        Log.enable = true
        Log.system("systme")
        Log.d(0xe04f)
        Log.n("network")
        Log.w("warning")
        Log.e("error")
        //Log.error(Error.self)
    }
}

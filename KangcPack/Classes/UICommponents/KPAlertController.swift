//
//  KPAlertController.swift
//  KPSDKEx
//
//  Created by Chans on 2017. 9. 1..
//  Copyright © 2017년 KangC. All rights reserved.
//

import Foundation
import UIKit

public protocol KPAlertControllerProtocol {

    var lTitle: String { get }
    var rTitle: String { get }
}

public struct KPAlertControllerDefault: KPAlertControllerProtocol {

    public var lTitle: String { return KPAlertControllerTitles().ok }
    public var rTitle: String { return KPAlertControllerTitles().cancel }
}

public struct KPAlertControllerRetry: KPAlertControllerProtocol {
    
    public var lTitle: String { return KPAlertControllerTitles().retry }
    public var rTitle: String { return KPAlertControllerTitles().cancel }
}

public struct KPAlertControllerMove: KPAlertControllerProtocol {
    
    public var lTitle: String { return KPAlertControllerTitles().move }
    public var rTitle: String { return KPAlertControllerTitles().cancel }
}

public struct KPAlertControllerNext: KPAlertControllerProtocol {
    
    public var lTitle: String { return KPAlertControllerTitles().next }
    public var rTitle: String { return KPAlertControllerTitles().cancel }
}

public struct KPAlertControllerCustom: KPAlertControllerProtocol {
    
    public var lTitle: String { return titles[0] }
    public var rTitle: String { return titles[1] }
    
    public var titles: [String] = []
    init(lTitle: String, rTitle: String?) {
        titles.append(lTitle)
        if let rightTitle = rTitle {
            titles.append(rightTitle)
        }
        else {
            titles.append("")
        }
        
    }
}

public struct KPAlertControllerTitles {
    public let ok       = "확인"
    public let cancel   = "취소"
    public let retry    = "재시도"
    public let close    = "닫기"
    public let move     = "이동"
    public let next     = "다음"
}


public typealias KPAlertControllerActionCloser = (UIAlertAction) -> Void

public class KPAlertController {
    
    public static var titles = KPAlertControllerTitles()
    
    // One Button
    public class func showAlert(title: String? = nil,
                                message: String? = nil,
                                buttonTitle: String = titles.ok,
                                closer: KPAlertControllerActionCloser? = nil) {
        
        let alert = self.show(title: title,
                              message: message,
                              leftButtonTitle: buttonTitle) { (alertAction) in
                                closer?(alertAction)
        }
        
        alert.show()

    }
    
    // Two Button
    public class func showConfirm(title: String? = nil,
                                  message: String? = nil,
                                  leftButtonTitle: String = titles.cancel,
                                  rightButtonTitle: String = titles.ok,
                                  closer: KPAlertControllerActionCloser? = nil) {
        
        let alert = self.show(title: title,
                              message: message,
                              leftButtonTitle: leftButtonTitle,
                              rightButtonTitle: rightButtonTitle) { (alertAction) in
                                closer?(alertAction)
        }
        
        alert.show()

    }
    
    public class func show(title: String? = nil,
                           message: String? = nil,
                           leftButtonTitle: String = titles.ok,
                           rightButtonTitle: String? = nil,
                           closer: KPAlertControllerActionCloser? = nil) -> UIAlertController {
        
        let alertController = UIAlertController.init(title: title,
                                                     message: message,
                                                     preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: leftButtonTitle,
                                                style: .cancel,
                                                handler: { (alertAction) in
                                                    closer?(alertAction)
        }))
        
        if let rbt = rightButtonTitle {
            alertController.addAction(UIAlertAction(title: rbt,
                                                    style: .default,
                                                    handler: { (alertAction) in
                                                        closer?(alertAction)
            }))
        }
        
        return alertController

    }
    
}


 extension UIAlertController {
    
    func show() {
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
            self.show(rootViewController, sender: nil)
        }

    }
}

//
//  KPExtentionNSObject.swift
//  KangcPack
//
//  Created by Chans on 2017. 9. 8..
//  Copyright © 2017년 KangC. All rights reserved.
//

import Foundation

public struct App {
    public static let name             = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    public static let displayName      = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    public static let bundleIdentifier = Bundle.main.bundleIdentifier ?? ""
    public static let appVersion       = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    public static let buildNumber      = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
}

extension App: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return debugDescription
    }
    
    public var debugDescription: String {
        var output: [String] = []
        output.append("***********************************************")
        output.append("[App Description]")
        output.append("[name]:              \(App.name)")
        output.append("[displayName]:       \(App.displayName)")
        output.append("[bundleIdentifier]:  \(App.bundleIdentifier)")
        output.append("[appVersion]:        \(App.appVersion)")
        output.append("[buildNumber]:       \(App.buildNumber)")
        return output.joined(separator: "\n")
    }
}

/// 키 윈도우에 붙어있는 최상위 네비게이션 컨트롤러를 반환한다.
public func KPRootNavigationController() -> UINavigationController? {
    return UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController
}

/// 최상위 뷰컨트롤러를 반환한다.
public func KPTopViewController() -> UIViewController? {
    let rootViewController = UIApplication.shared.delegate?.window??.rootViewController
    return KPTopViewController(for: rootViewController)
}

/// 타겟 뷰 기준으로 최상위 뷰컨트롤러를 반환한다.
public func KPTopViewController(`for` rootViewController: UIViewController?) -> UIViewController? {
    
    guard let rootViewController = rootViewController else { return nil }
    
    if let tabBarController = rootViewController as? UITabBarController {
        return KPTopViewController(for: tabBarController.selectedViewController!)
    }
    else if let naviController = rootViewController as? UINavigationController {
        return KPTopViewController(for: naviController.viewControllers.last!)
    }
    else if let viewController = rootViewController.presentedViewController {
        return KPTopViewController(for: viewController)
    }
    
    return rootViewController
}


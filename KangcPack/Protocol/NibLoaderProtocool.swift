//
//  NibLoaderProtocool.swift
//  KangcPack
//
//  Created by Chans on 2017. 9. 7..
//  Copyright © 2017년 KangC. All rights reserved.
//

import Foundation
import UIKit

public protocol NibLoaderProtocool: class {
    static var nibName: String { get }
}

extension NibLoaderProtocool {
    public static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension NibLoaderProtocool where Self: UIView {
    
    public static func instanceFromNib() -> Self? {
        
        guard let nibs = Bundle(for: self).loadNibNamed(nibName, owner: nil, options: nil) else {
            print(" [KangC PACK] <\(nibName)> - Don't have a Nib File")
            return nil
        }
        return nibs.lazy.filter { $0 is Self }.first as? Self
    }
}

extension NibLoaderProtocool where Self: UIViewController {

    public static func instance(_ identifier: String? = nil) -> Self {
        
        // from storyboard
        if let instance = self.instanceFromStoryboard(identifier) {
            return instance
        } else { print(" [KangC PACK] <\(nibName)> - Don't have a Storyboard ID") }
        
        // continue from nib
        if let instance = self.instanceFromNib(identifier) {
            return instance
        } else { print(" [KangC PACK] <\(nibName)> - Don't have a Nib File") }
        
        return self.init()
    }

    public static func instanceFromNib(_ nibName: String? = nil) -> Self? {
        return UIViewController(nibName: nibName ?? nibName, bundle: Bundle(for: self)) as? Self
    }

    public static func instanceFromStoryboard(_ storyboard: String?) -> Self? {
        if let sb = storyboard {
            let storyboard = UIStoryboard(name: sb, bundle: Bundle(for: self))
            return storyboard.instantiateViewController(withIdentifier: nibName) as? Self
        }
        else {
            return self.getStoryboardInstance(nibName) as? Self
        }
    }

    public static func getStoryboardInstance (_ identifier : String) -> UIViewController? {
        
        if let resourcePath = Bundle(for: self).resourcePath {
            let storyboardPaths : Array = self.storyboardPaths(resourcePath)
            //print("storyboardPaths: \(storyboardPaths)")
            for storyboardPath : String in storyboardPaths {
                //print("storyboardPath: \(storyboardPath)")
                let storyboardContents : Array = try! FileManager.default.contentsOfDirectory(atPath: storyboardPath)
                for nibName : String in storyboardContents {
                    //print("nibName: \(nibName)")
                    if (nibName == identifier + ".nib") {
                        let sbName : String = storyboardPath.lastPathComponent!.deletingPathExtension
                        let sb = UIStoryboard(name: sbName, bundle: Bundle.main)
                        return sb.instantiateViewController(withIdentifier: identifier)
                    }
                }
            }
        }
        
        return nil;
    }
    
    public static func storyboardPaths(_ resourcePath: String ) -> Array<String> {
        
        var fileNames : [String] = []
        let resourceContents : Array = try! FileManager.default.contentsOfDirectory(atPath: resourcePath)
        
        for itemPath : String  in resourceContents {
            if itemPath.pathExtension == "storyboardc" {
                fileNames.append(resourcePath.appendingPathComponent(path: itemPath))
            }
            else
            {
                let filePath : String = resourcePath + "/" + itemPath
                var isDirectory : ObjCBool = false
                let fileExistsAtPath : Bool = FileManager.default.fileExists(atPath: filePath, isDirectory: &isDirectory)
                
                // 디렉터리고 파일이 존재하면 재귀호출
                if (isDirectory.boolValue && fileExistsAtPath) {
                    let tempPaths : Array = self.storyboardPaths(filePath)
                    if tempPaths.count > 0 {
                        fileNames.append(contentsOf: tempPaths)
                    }
                }
            }
        }
        return fileNames
    }

}

extension UIViewController: NibLoaderProtocool {}
extension UIView: NibLoaderProtocool {}

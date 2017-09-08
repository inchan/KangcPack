//
//  KPProtocolReusable.swift
//  KangcPack
//
//  Created by Chans on 2017. 9. 8..
//  Copyright © 2017년 KangC. All rights reserved.
//

import Foundation
import UIKit

//MARK: Reusable
public protocol KPProtocolReusable: class {
    
     func register<T>(type: T.Type)
     func registers<T>(type: [T.Type])
     func dequeue<T>(type: T.Type)
}

extension KPProtocolReusable where Self: UITableView {
    
    public func registerCell<T>(type: T.Type) where T: KPProtocolReusableView, T: KPProtocolNibLoader {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reusableIdentifier)
    }
    
    public func registerCells<T>(types: [T.Type]) where T: KPProtocolReusableView, T: KPProtocolNibLoader {
        types.forEach { registerCell(type: $0) }
    }
    
    public func dequeueCell<T>(`for` indexPath: IndexPath?) -> T? where T:KPProtocolReusableView {
        let reuseIdentifier = T.reusableIdentifier
        if let i = indexPath {
            guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: i) as? T else {
                print("Could not dequeue cell: \(T.reusableIdentifier)")
                return nil
            }
            return cell
        }
        else {
            guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier) as? T else {
                print("Could not dequeue cell: \(T.reusableIdentifier)")
                return nil
            }
            return cell
        }
    }
}

extension KPProtocolReusable where Self: UICollectionView {
    
    public func registerCell<T>(type: T.Type) where T: KPProtocolReusableView, T: KPProtocolNibLoader {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.reusableIdentifier)
    }
    
    public func registerCells<T>(types: [T.Type]) where T: KPProtocolReusableView, T: KPProtocolNibLoader {
        types.forEach { registerCell(type: $0) }
    }
    
    public func dequeueCell<T>(`for` indexPath: IndexPath) -> T? where T:KPProtocolReusableView {
        let reuseIdentifier = T.reusableIdentifier
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? T else {
            print("Could not dequeue cell: \(T.reusableIdentifier)")
            return nil
        }
        return cell
    }
}


//MARK: ReusableView
public protocol KPProtocolReusableView: class {
    static var reusableIdentifier: String { get }
}

extension KPProtocolReusableView {
    public static var reusableIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension KPProtocolReusableView where Self: UIView { }
extension KPProtocolReusableView where Self: UITableViewCell { }
extension KPProtocolReusableView where Self: UICollectionViewCell { }

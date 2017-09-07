//
//  RootViewController.swift
//  Example
//
//  Created by Chans on 2017. 7. 27..
//  Copyright © 2017년 KangC. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnAction() {
    
        let rvc = RootViewController.instance()
        rvc.view.backgroundColor = UIColor.black
        self.present(rvc, animated: true, completion: nil)
    }
}


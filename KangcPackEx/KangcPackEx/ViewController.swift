//
//  ViewController.swift
//  KangcPackEx
//
//  Created by Chans on 2017. 9. 7..
//  Copyright © 2017년 KangC. All rights reserved.
//

import UIKit
import KangcPack

//extension UIViewController: KPProtocoolNibLoader {}

class ViewController: UIViewController, KPProtocolNibLoader {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let vc = ViewController.instance()
        Log.e(vc)
        if let tvc = KPTopViewController() {
            Log(tvc)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


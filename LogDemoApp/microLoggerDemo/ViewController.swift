//
//  ViewController.swift
//  microLogger
//
//  Created by Miroslav Sliacky on 26/02/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import UIKit
import MicroLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MLogger.logDebug(sender: self,
                         andMessage: "Main view loaded")
    }

}

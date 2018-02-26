//
//  AppDelegate.swift
//  microLogger
//
//  Created by Miroslav Sliacky on 26/02/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        MLogger.logLevel = .logLevelDebug
        MLogger.logDebug(sender: self,
                         andMessage: "Log level set.")
        
        return true
    }
    
}

//
//  AppDelegate.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import UIKit
import CoreData
import Fabric
import Crashlytics
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var applicationCoordinator: ApplicationCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupAnalytics()
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        PersitanceManager.shared.preloadData {
            self.applicationCoordinator = ApplicationCoordinator(window: window)
            self.applicationCoordinator?.start()
        }
        
        FirebaseApp.configure()
        GADMobileAds.configure(withApplicationID: AdMobIds.appId)
        
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        guard let vc = applicationCoordinator?.rootViewController else { return true }
        vc.restoreUserActivityState(userActivity)
        return true
    }
    
    // MARK: - Analytics
    
    fileprivate func setupAnalytics() {
        
        #if DEBUG || STAGING
        Fabric.with([Crashlytics.self, Answers.self])
        Fabric.sharedSDK().debug = true
        #else
        Fabric.with([Crashlytics.self, Answers.self])
        #endif
        
    }
}


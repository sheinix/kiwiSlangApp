//
//  AppCoordinator.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    //    let storage: StorageInstance //  1
    let window: UIWindow
    var rootViewController: UIViewController!
    
    init(window: UIWindow) {
        self.window = window
        let slangVM = SlangViewModel(slangWords: [])
        rootViewController = SlangViewerViewController(_associatedViewModel: slangVM)
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

//extension ApplicationCoordinator : CLMasterViewControllerProtocol {
//    func didSelect(navController: UINavigationController, at idx: IndexPath) {
//
//        if let splitVC = rootViewController as? CLSplitViewController {
//
//            splitVC.showDetailViewController(navController, sender: splitVC.masterVC)
//        }
//    }
//}

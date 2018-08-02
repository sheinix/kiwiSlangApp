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

    let window: UIWindow
    var rootViewController: UIViewController!
    
    init(window: UIWindow) {
        self.window = window
        let wordArray = PersitanceManager.shared.loadSlangWordsFor(country: Countries.newZealand)
        let slangVM = SlangViewModel(slangWords: wordArray)
        rootViewController = SlangViewerViewController(_associatedViewModel: slangVM)
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

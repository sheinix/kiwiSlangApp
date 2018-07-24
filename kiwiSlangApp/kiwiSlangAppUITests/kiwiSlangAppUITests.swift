//
//  kiwiSlangAppUITests.swift
//  kiwiSlangAppUITests
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import XCTest

class KiwiSlangAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        setupSnapshot(app)
        app.launch()
        snapshot("0Launch")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSwipeCards() {
        let app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        setupSnapshot(app)
        app.swipeRight()
        snapshot("01MainScreen")
        app.swipeRight()
        snapshot("02MainScreen")
        app.swipeRight()
        snapshot("03MainScreen")
    }
}

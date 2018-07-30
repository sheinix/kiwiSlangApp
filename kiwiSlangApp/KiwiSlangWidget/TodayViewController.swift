//
//  TodayViewController.swift
//  KiwiSlangWidget
//
//  Created by Juan Nuvreni on 28/07/18.
//  Copyright © 2018 sheinix. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var slangOfTheDayLabel: UILabel!
    @IBOutlet weak var slangWordLabel: UILabel!
    @IBOutlet weak var slangDescriptionLabel: UILabel!
    
    private let currentWord : SlangWordProtocol? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = L10n.slangOfTheDay
        self.backgroundView.applyGradientWith(UIColor.Pallete.CardBackground.gradient1,
                               UIColor.Pallete.CardBackground.gradient2,
                               UIColor.Pallete.CardBackground.gradient3)
        
        if let wordOftheDay = PersitanceManager.shared.getWordOfTheDay() {
            slangWordLabel.text = wordOftheDay.word
            slangDescriptionLabel.text = wordOftheDay.explanation
        }        
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
}

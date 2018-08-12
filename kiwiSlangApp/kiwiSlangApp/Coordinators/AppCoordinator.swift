//
//  AppCoordinator.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import Foundation
import UIKit
import CoreSpotlight
import MobileCoreServices

class ApplicationCoordinator: Coordinator {

    let window: UIWindow
    var rootViewController: UIViewController!
    
    init(window: UIWindow) {
        self.window = window
        let wordArray = PersitanceManager.shared.loadSlangWordsFor(country: Countries.newZealand)
        let slangVM = SlangViewModel(slangWords: wordArray)
        rootViewController = SlangViewerViewController(_associatedViewModel: slangVM)
        indexSearchableItemsWith(wordArray: wordArray)
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func indexSearchableItemsWith(wordArray: [SlangWordProtocol]){
        
        guard wordArray.count > 0 else { return }
        
        var searchableItems = [CSSearchableItem]()
        
        for word in wordArray {
            let searchItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            searchItemAttributeSet.title = word.word
            searchItemAttributeSet.contentDescription = L10n.meaning.appending("\n").appending(word.explanation)
            //            searchItemAttributeSet.thumbnailData = match.image
            
            let searchableItem = CSSearchableItem(uniqueIdentifier: word.word, domainIdentifier: "slang-words", attributeSet: searchItemAttributeSet)
            searchableItems.append(searchableItem)
        }
        
        CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) -> Void in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }
        }
    }
    
}

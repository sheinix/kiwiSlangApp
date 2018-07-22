//
//  PersitanceManager.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

private let persistanceSessionManager = PersitanceManager()

class PersitanceManager {

    class var shared: PersitanceManager {
        return persistanceSessionManager
    }
    
   
    // MARK: - Data Pre-Loading
    
    func preloadData() {
        
        guard let wordList = loadPlist() else { return }
        let slangWords = WordParser.parse(list: wordList)
        save(wordList : slangWords)
    }
    
    fileprivate func save(wordList : [SlangWord]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(wordList, update: true)
        }
    }
    
    fileprivate func loadPlist() -> [[String : String]]? {
        
        let errorBlock = {
            #if DEBUG
            fatalError("Couldn't Load the plist file")
            #else
            print("error loading plist")
            //TO-DO: Raise exception
            #endif
        }
        guard let filePath = Bundle.main.path(forResource: WordLists.nz, ofType: "plist") else {
            errorBlock()
            return nil
        }
        guard let dict = NSDictionary(contentsOfFile: filePath) else {
            errorBlock()
            return nil
        }
        guard let list = dict.value(forKey: "words") as? [[String : String]] else {
            errorBlock()
            return nil
        }
        
        return list
    }
    
    public func loadSlangWordsFor(country: Countries) -> [SlangWord] {
        let realm = try! Realm()
        let slangWords = realm.objects(SlangWord.self)
        return Array(slangWords)
        
    }
}

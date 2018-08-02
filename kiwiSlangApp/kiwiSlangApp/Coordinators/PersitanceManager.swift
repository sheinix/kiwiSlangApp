//
//  PersitanceManager.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import UIKit
import RealmSwift
import AFDateHelper

private let persistanceSessionManager = PersitanceManager()

class PersitanceManager {

    class var shared: PersitanceManager {
        return persistanceSessionManager
    }
    
   
    private let config : Realm.Configuration = {
        
        let directory: URL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: ConfigurationConstant.groupName)!
        let realmPath = directory.path.appending("/").appending(RealmDefault.dbProdName)
        let url = URL(fileURLWithPath: realmPath)
        let config = Realm.Configuration(fileURL: url, schemaVersion: 1, migrationBlock: { (migration, oldSchemaVersion) in
            if (oldSchemaVersion < 1) {
                migration.enumerateObjects(ofType: SlangWord.className()) { oldObject, newObject in
                }
            }
        })
        
        return config
    }()
    
    // MARK: - Data Pre-Loading
    
    func preloadData(completion: () -> Void) {
        
        guard let wordList = loadPlist() else { return }
        let slangWords = WordParser.parse(list: wordList)
        save(wordList : slangWords)
        completion()
    }
    
    fileprivate func save(wordList : [SlangWord]) {
        let realm = try! Realm(configuration: self.config)
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
    
    public func loadSlangWordsFor(country: Countries) -> [SlangWordProtocol] {
        let realm = try! Realm(configuration: self.config)
        if CommandLine.arguments.contains("--uitesting") {
            let slangWords = realm.objects(SlangWord.self)
            return Array(slangWords)
        } else {
            let slangWords = realm.objects(SlangWord.self).shuffled()
            return Array(slangWords)
        }
    }
    
    public func getWordOfTheDay() -> TodayExtensionUsable? {
        
        let realm = try! Realm(configuration: self.config)
        let words = realm.objects(SlangWord.self)
        let usedWords = words.filter({ $0.isUsed })
        let usedWordOfTheDay = usedWords.filter ({ Date().compare(DateComparisonType.isSameDay(as: $0.dateUsed!)) })
        if usedWordOfTheDay.count > 0 {
            return usedWordOfTheDay.first ?? nil
        }
        
        let unusedWords = words.filter({ !$0.isUsed })
        guard unusedWords.count > 0 else {
            updateToUnused(words: words)
            return words.first ?? nil
        }
        
        let word = unusedWords.first!
        markAsUsed(word: word)
        
        return word
    }
    
    fileprivate func markAsUsed(word: SlangWord) {
        let realm = try! Realm(configuration: self.config)
        realm.beginWrite()
        word.dateUsed = Date()
        try! realm.commitWrite()
    }
    
    fileprivate func updateToUnused(words: Results<SlangWord>) {
        let realm = try! Realm(configuration: self.config)
        realm.beginWrite()
        words.forEach { (slangWord) in
            slangWord.dateUsed = nil
        }
        try! realm.commitWrite()
    }
}

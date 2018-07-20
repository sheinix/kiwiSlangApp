//
//  PersitanceManager.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import UIKit
import CoreData

private let persistanceSessionManager = PersitanceManager()

class PersitanceManager {

    class var shared: PersitanceManager {
        return persistanceSessionManager
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "kiwiSlangApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                #if DEBUG
                fatalError("Unresolved error \(error), \(error.userInfo)")
                #else
                print("Error loading persistent store")
                //TO-DO: Raise error -> Notification
                #endif
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                #if DEBUG
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                #else
                print("Error Saving Context")
                //TO-DO: Raise error -> Notification
                #endif
            }
        }
    }
    
    // MARK: - Data Pre-Loading
    
    func preloadData() {
        
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
            return
        }
        guard let dict = NSDictionary(contentsOfFile: filePath) else {
            errorBlock()
            return
        }
        guard let list = dict.value(forKey: "words") as? [[String : String]] else {
            errorBlock()
            return
        }
        list.forEach { (wordElement) in
            
            print(wordElement)
            
        }
    }
}

//
//  WordParser.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import Foundation
import CoreData

struct WordParser {
    
    static func parse(dict : NSDictionary, in manageObjContext : NSManagedObjectContext) -> SlangWord? {
        
        guard let name = dict.value(forKey: "name") as? String,
              let meaning = dict.value(forKey: "meaning") as? String,
              let countryCode = dict.value(forKey: "countryCode") as? String else { return nil }
        
        if let slangWord = NSEntityDescription.insertNewObject(forEntityName: "SlangWord", into: manageObjContext) as? SlangWord {
            slangWord.setValue(name, forKey: "") = name
            slangWord.explanation = meaning
            slangWord.imageName = dict.value(forKey: "imgName") as! String
            slangWord.imageName = dict.value(forKey: "imgName") as! String
        }
    }
    
    
}

/*
 ["imgName": "", "name": "Flat Tack", "meaning": "As fast as you can go", "countryCode": "NZ"]
 */

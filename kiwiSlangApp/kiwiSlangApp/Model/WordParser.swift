//
//  WordParser.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import Foundation

struct WordParser {
    
    static func parse(dict : [String : String]) -> SlangWord? {
        
        guard let name = dict["name"],
              let meaning = dict["meaning"],
              let countryCode = dict["countryCode"] else { return nil }
        
        let slangWord = SlangWord()
        slangWord.wordName = name
        slangWord.wordMeaning = meaning
        if let imgName = dict["imageName"] {
            slangWord.imageName = imgName
        }
        
        let countryDB = Country()
        countryDB.code = countryCode
        let country = Countries(code: countryCode)
        countryDB.name = country.name
        countryDB.flagimgName = country.flagName
        
        
        slangWord.country = countryDB
        
        return slangWord
    }
    
    static func parse(list: [[String : String]]) -> [SlangWord] {
        var words : [SlangWord] = []
        list.forEach { (wordDict) in
            if let unwrappedWord = parse(dict: wordDict) {
                words.append(unwrappedWord)
            }
        }
        return words
    }
}

/*
 ["imgName": "", "name": "Flat Tack", "meaning": "As fast as you can go", "countryCode": "NZ"]
 */

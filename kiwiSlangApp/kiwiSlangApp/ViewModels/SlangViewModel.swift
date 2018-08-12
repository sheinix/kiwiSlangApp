//
//  SlangViewModel.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import Foundation

struct SlangViewModel {
    
    var slangWords : [SlangWordProtocol] = []
    var hasRequestedRating : Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.askedForRating)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.askedForRating)
        }
    }
    
    public mutating func showFirst(word: String) {
        guard let slang = slangWords.filter({ $0.word == word }).first else { return }
        guard let idx = slangWords.index(where: { $0.word == word }) else { return }
        slangWords.remove(at: idx)
        slangWords.insert(slang, at: 0)
    }
}

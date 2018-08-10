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
    
    
}

//
//  CountryFactory.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import Foundation

enum Countries : String {
    case newZealand
    
    var name : String {
        switch self {
        case .newZealand: return "New Zealand"
        }
    }
    
    var code : String {
        switch self {
        case .newZealand: return "NZ"
        }
    }
    
    var object : Country {
        return Country(countryCode: self.code)
    }
}

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
    case argentina
    
    var name : String {
        switch self {
        case .newZealand: return "New Zealand"
        case .argentina: return "Argentina"
        }
    }
    
    var code : String {
        switch self {
        case .newZealand: return "NZ"
        case .argentina: return "ARG"
        }
    }
    
    var flagName : String {
        switch self {
        case .newZealand: return "nz"
        case .argentina: return "ar"
        }
    }
    
    init(code: String) {
        switch code {
        case "NZ": self = .newZealand
        case "ARG": self = .argentina
        default: self = .newZealand
        }
    }
}

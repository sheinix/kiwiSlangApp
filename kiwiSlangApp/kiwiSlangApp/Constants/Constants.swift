//
//  Constants.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import Foundation

struct WordLists {
    static let nz : String = "nzSlang"
}

struct RealmDefault {
    static let dbProdName = "Production.realm"
}

struct ConfigurationConstant {
    static let groupName = "group.kiwiSlangApp"
}

struct AdMobIds {
    static let appId = "ca-app-pub-4978730909602502~4269680985"
    #if DEBUG
    static let bannerID = "ca-app-pub-3940256099942544/2934735716"
    #else
    static let bannerID = "ca-app-pub-3940256099942544/2934735716" //"ca-app-pub-4978730909602502/9549927826"
    #endif
}

struct UserDefaultsKeys {
    static let askedForRating = "askedForRating"
}

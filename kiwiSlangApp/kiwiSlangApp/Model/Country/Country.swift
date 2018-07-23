//
//  Country.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 22/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import Foundation
import RealmSwift


class Country : Object {
    @objc dynamic var name : String?
    @objc dynamic var code : String?
    @objc dynamic var flagimgName : String?
    
    override open static func primaryKey() -> String? {
        return "code"
    }
}

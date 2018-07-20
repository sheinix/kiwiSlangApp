//
//  Country+CoreDataClass.swift
//  
//
//  Created by Juan Nuvreni on 19/07/2018.
//
//

import Foundation
import CoreData

@objc(Country)
public class Country: NSManagedObject {

    convenience init(countryCode : String) {
        self.init()
        self.code = countryCode
        
    }
}

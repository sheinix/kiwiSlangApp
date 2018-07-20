//
//  Country+CoreDataProperties.swift
//  
//
//  Created by Juan Nuvreni on 19/07/2018.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var name: String?
    @NSManaged public var code: String?
    @NSManaged public var flagImgName: String?

}


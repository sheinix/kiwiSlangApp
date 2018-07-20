//
//  SlangWord+CoreDataProperties.swift
//  
//
//  Created by Juan Nuvreni on 19/07/2018.
//
//

import Foundation
import CoreData
import UIKit

extension SlangWord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SlangWord> {
        return NSFetchRequest<SlangWord>(entityName: "SlangWord")
    }

    @NSManaged public var wordName: String?
    @NSManaged public var wordMeaning: String?
    @NSManaged public var imageName: String?
    @NSManaged public var country: Country?

}

extension SlangWord : SlangWordProtocol {
    var word: String {
        return wordName ?? ""
    }
    
    var explanation: String {
        return wordMeaning ?? ""
    }
    
    var origin : Country? {
        return country
    }
    var image: UIImage? {
        guard let imgName = imageName else { return nil }
        return UIImage(named: imgName)
    }
    
    var view: UIView? {
        guard let img = self.image else { return nil }
        return UIImageView(image: img)
    }
}

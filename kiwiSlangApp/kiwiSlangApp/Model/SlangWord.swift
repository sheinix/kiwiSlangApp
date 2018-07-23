//
//  SlangWord.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 22/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit


class SlangWord : Object {
    @objc dynamic var wordName : String?
    @objc dynamic var wordMeaning: String?
    @objc dynamic var imageName: String?
    @objc dynamic var country: Country?
    
    override open static func primaryKey() -> String? {
        return "wordName"
    }
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
        let card = CardView.instanceFromNib() as! CardView
        card.mainLabel.text = word
        card.detailLabel.text = explanation
        return card
    }
}

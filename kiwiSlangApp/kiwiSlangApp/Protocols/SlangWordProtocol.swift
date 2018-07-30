//
//  SlangWordProtocol.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import Foundation
import UIKit

protocol SlangWordProtocol {
    var word : String { get }
    var explanation : String { get }
    var origin : Country? { get }
    var image : UIImage? { get }
    var view : UIView? { get }
}

protocol TodayExtensionUsable : SlangWordProtocol {
    var isUsed : Bool { get }
}

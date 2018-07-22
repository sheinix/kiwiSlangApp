//
//  CardView.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 22/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import UIKit

class CardView: UIView {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    fileprivate func setupView() {
        cardStyle()
    }
}

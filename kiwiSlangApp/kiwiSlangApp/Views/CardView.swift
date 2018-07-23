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
        self.mainLabel.textColor = .white
        self.detailLabel.textColor = .white
        self.applyGradientWith(UIColor.Pallete.CardBackground.gradient1,
                               UIColor.Pallete.CardBackground.gradient2,
                               UIColor.Pallete.CardBackground.gradient3)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let subLayers = self.layer.sublayers, let gradient = subLayers[0] as? CAGradientLayer else { return }
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradient.frame = self.bounds
        gradient.cornerRadius = 20.0
        CATransaction.commit()
    }
}

//
//  UIViewExtension.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func applyGradientWith(_ colors: UIColor...) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
//        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: String(describing: self), bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func cardStyle() {
        self.layer.cornerRadius = 20.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowRadius = 12.0
        self.layer.shadowOpacity = 0.7
    }
    
    func updateGradientLayerFrame(cornerRadius : CGFloat) {
        guard let subLayers = self.layer.sublayers, let gradient = subLayers[0] as? CAGradientLayer else { return }
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradient.frame = self.bounds
        gradient.cornerRadius = cornerRadius
        CATransaction.commit()
    }
}

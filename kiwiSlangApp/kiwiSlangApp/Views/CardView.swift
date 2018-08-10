//
//  CardView.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 22/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import UIKit

protocol CardViewProtocolDelegate : class {
    func didTapOnButtonWith(word: String, meaning: String)
}

class CardView: UIView {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    weak var delegateCardView : CardViewProtocolDelegate?
    
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
        shareButton.addTarget(self, action: #selector(didTapOnButton), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateGradientLayerFrame(cornerRadius: 20.0)
    }
    
    @objc func didTapOnButton() {
        if let word = mainLabel.text, let meaning = detailLabel.text {
            delegateCardView?.didTapOnButtonWith(word: word, meaning: meaning)
        }
    }
}

//
//  SlangViewerViewController.swift
//  kiwiSlangApp
//
//  Created by Juan Nuvreni on 19/07/2018.
//  Copyright © 2018 sheinix. All rights reserved.
//

import UIKit
import Koloda
import SnapKit

class SlangViewerViewController: UIViewController, MainViewControllerProtocol {
    
    var viewModel : SlangViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.applyGradientWith(topColor: UIColor.Pallete.gradientTop, bottomColor: UIColor.Pallete.gradientBottom)
        
        let cardsView = KolodaView(frame: .zero)
        cardsView.dataSource = self
        cardsView.delegate = self
        view.addSubview(cardsView)
        cardsView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(120)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
    }

}

extension SlangViewerViewController : KolodaViewDelegate & KolodaViewDataSource {
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        guard let view = viewModel.slangWords[index].view else { return UIView() }
        return view
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return viewModel.slangWords.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }

}

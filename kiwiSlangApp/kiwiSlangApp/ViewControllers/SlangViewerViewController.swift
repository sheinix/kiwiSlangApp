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
import GoogleMobileAds

class SlangViewerViewController: UIViewController, MainViewControllerProtocol {
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    let bannerView : GADBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
    var viewModel : SlangViewModel!
    var isiPad : Bool = UIDevice.current.userInterfaceIdiom == .pad
    var edgeInset : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.applyGradientWith(UIColor.Pallete.BackGroundViewColors.gradientTop, UIColor.Pallete.BackGroundViewColors.gradientBottom)
        edgeInset = isiPad ? 40 : 20
        bottomLabel.text = L10n.helpInstructionLabel
        let cardsView = KolodaView(frame: .zero)
        cardsView.dataSource = self
        cardsView.delegate = self
        view.addSubview(cardsView)
        cardsView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().inset(edgeInset)
            make.right.equalToSuperview().inset(edgeInset)
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        adSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.updateGradientLayerFrame(cornerRadius: 0.0)
    }

    fileprivate func adSetup() {
        addBannerViewToView(bannerView)
        bannerView.adUnitID = AdMobIds.bannerID
        bannerView.rootViewController = self
        bannerView.delegate = self
        let adRequest = GADRequest()
        #if DEBUG
        adRequest.testDevices = ["6736421560b539d2e37c4aa765012ed4"]
        #endif
        bannerView.load(adRequest)
    }
}

// MARK: - KolodaViewDelegate & KolodaViewDataSource

extension SlangViewerViewController : KolodaViewDelegate & KolodaViewDataSource {
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        guard let view = viewModel.slangWords[index].view else { return UIView() }
        return view
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return viewModel.slangWords.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return  isiPad ? .slow : .fast
    }
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.resetCurrentCardIndex()
    }
}

// MARK: - GADBannerViewDelegate

extension SlangViewerViewController : GADBannerViewDelegate {
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        bannerView.alpha = 0
        UIView.animate(withDuration: 1.0, animations: {
            bannerView.alpha = 1
        })
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        #if DEBUG
            print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
        #endif
    }
    
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
    
    
}

//
//  SeeAllCollectionReusableView.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

final class SeeAllCollectionReusableView: NibCollectionReusableView {

    @IBOutlet weak var seeAllButton: UIButton!
    
    ///
    weak var delegate: (any SeeAllReusableViewDelegate)?
    
    override func setupAttributes() {
        super.setupAttributes()
        
        var config = UIButton.Configuration.plain()
        config.title = "See all"
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        seeAllButton.configuration = config
    }
    
    @IBAction func didTapSeeAllButton(_ sender: UIButton) {
        delegate?.seeAllReusableView(self, didSelectSeeAllButton: sender)
    }
}

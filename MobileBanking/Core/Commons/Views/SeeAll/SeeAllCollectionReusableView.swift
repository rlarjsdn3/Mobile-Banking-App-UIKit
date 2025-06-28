//
//  SeeAllCollectionReusableView.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

final class SeeAllCollectionReusableView: NibCollectionReusableView {

    ///
    weak var delegate: (any SeeAllReusableViewDelegate)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func didTapSeeAllButton(_ sender: UIButton) {
        delegate?.seeAllReusableView(self, didSelectSeeAllButton: sender)
    }
}

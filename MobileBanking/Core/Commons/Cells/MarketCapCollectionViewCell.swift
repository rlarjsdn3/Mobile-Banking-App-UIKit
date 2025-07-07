//
//  MarketCapCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 7/7/25.
//

import UIKit

final class MarketCapCollectionViewCell: NibCollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var changeRateLabel: UILabel!

    override func setupAttributes() {
        super.setupAttributes()
    }
}

extension MarketCapCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter marketInfo: <#marketInfo description#>
    func configure(with marketInfo: MarketInfo) {
    }
}

//
//  CryptoCollectionViewListCell.swift
//  MobileBanking
//
//  Created by 김건우 on 7/7/25.
//

import UIKit

final class CryptoCollectionViewListCell: NibCollectionVieweListCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var chartsView: UIView!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var changeRateLabel: UILabel!
    @IBOutlet weak var seperatorView: UIView!

    override func setupAttributes() {
        super.setupAttributes()
    }
}

extension CryptoCollectionViewListCell {
    
    /// <#Description#>
    /// - Parameter crypto: <#crypto description#>
    func configure(with crypto: Crypto) {

    }
}

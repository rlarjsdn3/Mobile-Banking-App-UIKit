//
//  CryptoCollectionViewListCell.swift
//  MobileBanking
//
//  Created by 김건우 on 7/7/25.
//

import UIKit

final class CryptoCollectionViewListCell: NibCollectionVieweListCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var chartsView: LineChartsView!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var changeRateLabel: UILabel!
    @IBOutlet weak var seperatorView: UIView!

    override func setupAttributes() {
        super.setupAttributes()

        imageContainerView.backgroundColor = .systemGray5
        imageContainerView.layer.cornerRadius = imageContainerView.frame.width / 2
        imageContainerView.layer.masksToBounds = true
    }
}

extension CryptoCollectionViewListCell {
    
    /// <#Description#>
    /// - Parameter crypto: <#crypto description#>
    func configure(with crypto: Crypto) {
        imageView.image = crypto.logo
        tickerLabel.text = crypto.ticker
        fullNameLabel.text = crypto.fullName
        currentPriceLabel.text = NSNumber(value: crypto.currentPrice)
            .formatted(
                with: .currency(
                    plusSign: "",
                    minusSign: "",
                    fractionalDigits: 2
                )
            )

        changeRateLabel.text = NSNumber(value: crypto.changeRate)
            .formatted(with: .percentage(fractionalDigits: 2))
        changeRateLabel.textColor = crypto.changeRate >= 0
        ? .systemRed : .bankingGreen

        chartsView.values = crypto.price24h
        chartsView.strokeColor = crypto.changeRate >= 0
        ? .systemRed : .bankingGreen
    }
}

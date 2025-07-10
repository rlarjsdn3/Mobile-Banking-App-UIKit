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

    /// 셀에 가상자산 정보를 설정합니다.
    ///
    /// - Parameter crypto: 셀에 표시할 `Crypto` 모델입니다.
    ///
    /// 해당 메서드는 가상자산의 로고, 티커, 전체 이름, 현재 가격, 변동률,
    /// 24시간 가격 변동 차트를 셀의 각 구성 요소에 설정합니다.
    /// 변동률에 따라 텍스트 색상과 차트 선 색상도 동적으로 적용됩니다.
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

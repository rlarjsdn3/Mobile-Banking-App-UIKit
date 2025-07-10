//
//  ThisWeekCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 7/3/25.
//

import UIKit

final class ThisWeekCollectionViewCell: NibCollectionViewCell {
    
    @IBOutlet weak var totalAmountLabel: UILabel!

    @IBOutlet weak var amountImageView: UIImageView!
    @IBOutlet weak var amountDifferenceLabel: UILabel!
    @IBOutlet weak var differenceRateLabel: UILabel!
    
    @IBOutlet weak var masterCardButton: TintedCircleButton!
    @IBOutlet weak var visaCardButton: TintedCircleButton!
    @IBOutlet weak var paypalButton: TintedCircleButton!
    @IBOutlet weak var plusButton: TintedCircleButton!
    
    override func setupAttributes() {
        super.setupAttributes()
        
        masterCardButton.setImage(.mastercard, sizeRatio: 0.50)
        visaCardButton.setImage(.visa, sizeRatio: 0.55)
        paypalButton.setImage(.paypal, sizeRatio: 0.40)
        plusButton.setImage(.plus, sizeRatio: 0.30)
    }
}

extension ThisWeekCollectionViewCell {
    
    /// 셀에 이번 주 지출 정보를 설정합니다.
    ///
    /// - Parameter thisWeek: 셀에 표시할 이번 주 지출 정보(`WeeklySpending`)입니다.
    ///
    /// 해당 메서드는 총 지출 금액을 통화 형식으로 포맷하여 표시하며,
    /// 지출 증감 금액 및 변화율은 별도의 설정 메서드를 통해 레이블에 적용합니다.
    func configure(with thisWeek: WeeklySpending) {
        totalAmountLabel.text = NSNumber(value: thisWeek.totalAmount)
            .formatted(with: .currency(
                plusSign: "",
                minusSign: "",
                currencySymbol: "$",
                fractionalDigits: 2)
            )

        configureAmountLabel(thisWeek.amountDifference, thisWeek.changeRate)
    }

    private func configureAmountLabel(
        _ amountDifference: Double,
        _ changeRate: Double
    ) {
        amountImageView.image = amountDifference >= 0
        ? UIImage(systemName: "arrow.up.right") : UIImage(systemName: "arrow.down.right")
        amountImageView.tintColor = amountDifference >= 0
        ? .bankingGreen : .systemRed

        amountDifferenceLabel.text = NSNumber(value: amountDifference)
            .formatted(with: .currency(
                plusSign: "",
                minusSign: "-",
                currencySymbol: "$",
                fractionalDigits: 2)
            )
        amountDifferenceLabel.textColor = amountDifference >= 0
        ? .bankingGreen : .systemRed

        differenceRateLabel.text = "(" +    changeRate.formatted(.percent) + ")"
        differenceRateLabel.textColor = changeRate >= 0
        ? .bankingGreen : .systemRed
    }
}

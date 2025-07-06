//
//  ThisWeekCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 7/3/25.
//

import UIKit

final class ThisWeekCollectionViewCell: NibCollectionViewCell {
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var amountDifferenceLabel: UILabel!
    @IBOutlet weak var differenceRateLabel: UILabel!
    
    @IBOutlet weak var masterCardButton: TintedCircleButton!
    @IBOutlet weak var visaCardButton: TintedCircleButton!
    @IBOutlet weak var paypalButton: TintedCircleButton!
    @IBOutlet weak var plusButton: TintedCircleButton!
    
    override func setupAttributes() {
        super.setupAttributes()
        
        masterCardButton.setImage(.mastercard, sizeRatio: 0.45)
        visaCardButton.setImage(.visa, sizeRatio: 0.50)
        paypalButton.setImage(.paypal, sizeRatio: 0.35)
        plusButton.setImage(.plus, sizeRatio: 0.25)
    }
}

extension ThisWeekCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter thisWeek: <#thisWeek description#>
    func configure(with thisWeek: WeeklySpending) {
        totalAmountLabel.text = NSNumber(value: thisWeek.totalAmount)
            .formatted(with: .currency(
                plusSign: "",
                minusSign: "",
                currencySymbol: "$",
                fractionalDigits: 2)
            )
        amountDifferenceLabel.text = NSNumber(value: thisWeek.amountDifference)
            .formatted(with: .currency(
                plusSign: "",
                minusSign: "",
                currencySymbol: "$",
                fractionalDigits: 2)
            )
        differenceRateLabel.text = "(" + thisWeek.changeRate.formatted(.percent) + ")"
    }
}

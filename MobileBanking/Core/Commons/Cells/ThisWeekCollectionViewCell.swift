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
        differenceRateLabel.text = "(" + thisWeek.amountDifference.formatted(.percent) + ")"
        
    }
}

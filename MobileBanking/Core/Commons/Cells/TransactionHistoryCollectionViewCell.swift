//
//  TransactionHistoryCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

final class TransactionHistoryCollectionViewCell: NibCollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var createAtLabel: UILabel!
    @IBOutlet weak var seperator: UIView!

    override func setupAttributes() {
        super.setupAttributes()

        imageContainerView.backgroundColor = .systemGray5
        imageContainerView.layer.cornerRadius = imageContainerView.frame.width / 2
        imageContainerView.layer.masksToBounds = true
    }
}

extension TransactionHistoryCollectionViewCell {
    
    func configure(with history: TransactionHistory) {
        imageView.image = history.image
        titleLabel.text = history.title
        timeLabel.text = formattedTime(history.date)
        amountLabel.text = formattedAmount(history.amount)
        createAtLabel.text = history.date.formatted(with: .MMddyyyy)
    }
    
    private func formattedTime(_ date: Date) -> String {
        let formattedTime = date.formatted(with: .hhmma)
        if let string = date.doesReleativeDateFormatted() {
            return string + ", " + formattedTime
        } else {
            return formattedTime
        }
    }
    
    private func formattedAmount(_ amount: Double) -> String? {
        NSNumber(value: amount).formatted(
            with: .currency(fractionalDigits: 0)
        )
    }
}

//
//  SavingsCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

final class SavingsCollectionViewCell: NibCollectionViewCell {

    @IBOutlet weak var containerView: LinearGradientView!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var dashedLineView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var expDateLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func setupAttributes() {
        super.setupAttributes()

        containerView.apply(
            colors: [.bankingBlue, .bankingBlue.withAlphaComponent(0.6)],
            startPoint: CGPoint(x: 0, y: 1),
            endPoint: CGPoint(x: 1, y: 0)
        )
        containerView.layer.cornerRadius = 32
        containerView.layer.masksToBounds = true
        imageContainerView.layer.cornerRadius = imageContainerView.frame.width / 2
        imageContainerView.layer.masksToBounds = true
        dashedLineView.addDashedLine(strokeColor: .systemBackground, lineWidth: 1.5)
        dashedLineView.layer.masksToBounds = true
    }
}

extension SavingsCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter saving: <#saving description#>
    func configure(with saving: Saving) {
        imageView.image = saving.image.withTintColor(.systemBackground, renderingMode: .alwaysTemplate)
        titleLabel.text = saving.title
        totalAmountLabel.attributedText = attributedAmount(saving.totalAmount)
        expDateLabel.text = saving.expirationDate.formatted(with: .MMddyyyy)
    }

    private func attributedAmount(_ amount: Double) -> NSAttributedString {
        guard let amount = formattedAmount(amount),
              let dotIndex = amount.firstIndex(of: ".") else {
            return .init()
        }

        let endIndex = amount.endIndex

        return NSAttributedString(string: amount)
            .font(ofSize: 18, weight: .regular, from: dotIndex, to: endIndex)
            .forergroundColor(.secondaryLabel, from: dotIndex, to: endIndex)
    }

    private func formattedAmount(_ amount: Double) -> String? {
        NSNumber(value: amount)
            .formatted(
                with: .currency(
                    plusSign: nil,
                    minusSign: nil,
                    fractionalDigits: 2
                )
            )
    }
}

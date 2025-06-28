//
//  CardCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

final class CardCollectionViewCell: NibCollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var availableBalanceLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var cardCodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func setupAttributes() {
        super.setupAttributes()
        
        containerView.layer.cornerRadius = 24
        containerView.layer.cornerCurve = .continuous
        containerView.layer.masksToBounds = true
        
        logoImageView.tintColor = .white
    }
}

extension CardCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter card: <#card description#>
    func configure(with card: Card) {
        ownerLabel.text = card.ownerName
        availableBalanceLabel.attributedText = attributedAmount(card.availableBaleance)
        logoImageView.image = card.cardLogo.withRenderingMode(.alwaysTemplate)
        cardCodeLabel.text = "Card Code ....\(card.cardCode)"
    }
    
    private func attributedAmount(_ amount: Double) -> NSAttributedString {
        let ptSize = availableBalanceLabel.font.pointSize
        guard let amount = formattedAmount(amount),
              let startIndex = amount.firstIndex(where: { $0.isNumber }),
              let endIndex = amount.lastIndex(of: ".") else {
            return .init()
        }
        
        return NSMutableAttributedString(string: amount)
            .with(
                forKey: .font,
                from: startIndex,
                to: endIndex,
                with: UIFont.systemFont(ofSize: ptSize, weight: .bold)
            )
    }
    
    private func formattedAmount(_ amount: Double) -> String? {
        NSNumber(value: amount).formatted(
            with: .currency(
                plusSign: "",
                minusSign: ""
            )
        )
    }
}

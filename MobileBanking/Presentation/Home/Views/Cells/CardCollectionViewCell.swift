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
        availableBalanceLabel.text = card.availableBaleance.formatted()
        logoImageView.image = card.cardLogo.withRenderingMode(.alwaysTemplate)
        cardCodeLabel.text = "Card Code ....\(card.cardCode)"
    }
}

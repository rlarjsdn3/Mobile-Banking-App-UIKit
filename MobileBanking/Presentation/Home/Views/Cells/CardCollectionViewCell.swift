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
    
    override func setupAttributes() {
        super.setupAttributes()
        
        containerView.layer.cornerRadius = 24
        containerView.layer.cornerCurve = .continuous
        containerView.layer.masksToBounds = true
        
        logoImageView.tintColor = .white
    }
}

extension CardCollectionViewCell {
    
    /// 셀에 카드 정보를 설정합니다.
    ///
    /// - Parameter card: 셀에 표시할 `Card` 모델입니다.
    ///
    /// 해당 메서드는 카드 소유자 이름, 사용 가능 잔액, 카드 로고, 카드 코드 등의 정보를
    /// 셀의 각 UI 구성 요소에 설정합니다. 카드 코드는 강조 폰트로 표시되며,
    /// 카드 로고는 템플릿 모드로 렌더링되어 틴트 컬러 적용이 가능합니다.
    func configure(with card: Card) {
        ownerLabel.text = card.ownerName
        availableBalanceLabel.attributedText = attributedAmount(card.availableBaleance)
        logoImageView.image = card.cardLogo.withRenderingMode(.alwaysTemplate)
        let ptSize = cardCodeLabel.font.pointSize
        cardCodeLabel.attributedText = NSMutableAttributedString(string: "Card Code ...\(card.cardCode)")
            .with(forKey: .font, of: "...\(card.cardCode)", with: UIFont.systemFont(ofSize: ptSize, weight: .medium))
    }
    
    private func attributedAmount(_ amount: Double) -> NSAttributedString {
        let ptSize = availableBalanceLabel.font.pointSize
        guard let amount = formattedAmount(amount),
              let startIndex = amount.firstIndex(where: { $0.isNumber }),
              let endIndex = amount.lastIndex(of: ".") else {
            return .init()
        }
        
        return NSAttributedString(string: amount)
            .font(ofSize: ptSize, weight: .bold, from: startIndex, to: endIndex)
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

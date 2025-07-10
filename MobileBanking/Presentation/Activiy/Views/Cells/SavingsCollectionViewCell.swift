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

    /// 셀에 적금 정보를 설정합니다.
    ///
    /// - Parameter saving: 셀에 표시할 `Saving` 모델입니다.
    ///
    /// 해당 메서드는 전달받은 적금 정보를 기반으로,
    /// 이미지, 제목, 총 금액, 만기일 등을 셀의 구성 요소에 설정합니다.
    /// 이미지는 시스템 배경색으로 틴트 처리되며, 금액은 속성 문자열로 서식화됩니다.
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

//
//  TotalBalanceCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

final class TotalBalanceCollectionViewCell: NibCollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    override func setupAttributes() {
        super.setupAttributes()

        containerView.backgroundColor = .bankingGray
        containerView.layer.cornerRadius = 24
        containerView.layer.masksToBounds = true
    }
}

extension TotalBalanceCollectionViewCell {
    
    /// 셀에 전체 잔액 정보를 설정합니다.
    ///
    /// - Parameter balance: 셀에 표시할 `Balance` 모델입니다.
    ///
    /// 해당 메서드는 전달받은 잔액 정보를 기반으로
    /// 제목과 총 금액을 셀의 레이블에 설정합니다.
    /// 금액은 속성 문자열로 서식화되어 표시됩니다.
    func configure(with balance: Balance) {
        titleLabel.text = balance.title
        totalAmountLabel.attributedText = attributedAmount(balance.totalAmount)
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

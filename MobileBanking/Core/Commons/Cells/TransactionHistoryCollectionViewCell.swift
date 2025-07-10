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
    
    /// 거래 내역 정보를 셀에 설정합니다.
    ///
    /// - Parameter history: 표시할 거래 내역 정보입니다.
    ///
    /// 해당 메서드는 전달받은 `TransactionHistory` 객체를 기반으로
    /// 이미지, 제목, 시간, 금액, 생성일 라벨을 각각 설정합니다.
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

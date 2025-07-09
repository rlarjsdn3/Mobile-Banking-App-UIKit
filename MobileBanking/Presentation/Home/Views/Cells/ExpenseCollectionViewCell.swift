//
//  ExpenseCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

final class ExpenseCollectionViewCell: NibCollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var walletContainerView: UIView!
    @IBOutlet weak var arrowUpAndRightContainerView: UIView!
    @IBOutlet weak var expenseTypeLabel: UILabel!
    @IBOutlet weak var expenseDescriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.layer.cornerRadius = 24
        containerView.layer.cornerCurve = .continuous
        containerView.layer.borderColor = UIColor.bankingGray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.masksToBounds = true
        
        walletContainerView.layer.cornerRadius = walletContainerView.frame.width / 2
        walletContainerView.layer.borderColor = UIColor.bankingGray.cgColor
        walletContainerView.layer.borderWidth = 1
        walletContainerView.layer.masksToBounds = true
        
        arrowUpAndRightContainerView.layer.cornerRadius = arrowUpAndRightContainerView.frame.width / 2
        arrowUpAndRightContainerView.layer.borderColor = UIColor.bankingPurple.cgColor
        arrowUpAndRightContainerView.layer.borderWidth = 1
        arrowUpAndRightContainerView.layer.masksToBounds = true
    }
    
    override func setupAttributes() {
        super.setupAttributes()
        
        containerView.backgroundColor = .bankingSecondaryBackground
    }
}

extension ExpenseCollectionViewCell {
    
    func configure(with expense: Expense) {
        expenseTypeLabel.text = expense.title
        expenseDescriptionLabel.text = expense.subtitle
        amountLabel.attributedText = attributedAmount(expense.amount)
    }
    
    private func attributedAmount(_ amount: Double) -> NSAttributedString {
        guard let amount = formattedAmount(amount),
              let startIndex = amount.firstIndex(where: { $0.isNumber }) else {
            return .init()
        }
        
        let endIndex = amount.endIndex
        let ptSize = amountLabel.font.pointSize
        
        // 문자열에 콤마(,)가 있으면
        if let commaIndex = amount.firstIndex(of: ",") {
            return NSAttributedString(string: amount)
                .font(ofSize: 34, weight: .regular, from: startIndex, to: commaIndex)
                .font(ofSize: ptSize, weight: .regular, from: commaIndex, to: endIndex)
                .forergroundColor(.systemGray, from: commaIndex, to: endIndex)
        // 문자열에 콤마(,)가 없으면
        } else {
            return NSMutableAttributedString(string: amount)
                .font(ofSize: 34, weight: .regular, from: startIndex, to: endIndex)
        }
    }
    
    
    private func formattedAmount(_ amount: Double) -> String? {
        NSNumber(value: amount).formatted(
            with: .currency(
                plusSign: "",
                minusSign: "",
                currencySymbol: "$ ",
                fractionalDigits: 0
            )
        )
    }
}

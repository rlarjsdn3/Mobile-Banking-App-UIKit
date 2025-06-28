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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
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
        amountLabel.text = expense.amount.formatted()
    }
}

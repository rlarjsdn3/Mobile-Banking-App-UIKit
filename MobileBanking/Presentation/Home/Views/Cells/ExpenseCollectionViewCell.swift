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
    
    override func setupAttributes() {
        super.setupAttributes()
    }
}

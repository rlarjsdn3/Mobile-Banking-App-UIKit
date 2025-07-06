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
    }
}

extension TotalBalanceCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter balance: <#balance description#>
    func configure(with balance: Balance) {
        
    }
}

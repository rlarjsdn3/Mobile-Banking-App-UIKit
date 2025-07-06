//
//  SavingsCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

final class SavingsCollectionViewCell: NibCollectionViewCell {

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
        
        
    }
}

extension SavingsCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter saving: <#saving description#>
    func configure(with saving: Saving) {
        
    }
}

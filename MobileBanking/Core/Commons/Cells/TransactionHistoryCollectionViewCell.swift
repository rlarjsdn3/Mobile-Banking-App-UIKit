//
//  TransactionHistoryCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

final class TransactionHistoryCollectionViewCell: NibCollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var createAtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

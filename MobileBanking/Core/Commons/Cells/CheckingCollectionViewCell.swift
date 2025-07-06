//
//  CheckingCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 7/3/25.
//

import UIKit

class CheckingCollectionViewCell: NibCollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageContainerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageContainerView.layer.cornerRadius = imageContainerView.frame.width / 2
        imageContainerView.layer.masksToBounds = true
    }
    
    override func setupAttributes() {
        super.setupAttributes()
        
        containerView.backgroundColor = .bankingGray
        containerView.layer.cornerRadius = 32
        containerView.layer.cornerCurve = .continuous
        containerView.layer.masksToBounds = true
    }
}

extension CheckingCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter info: <#info description#>
    func configure(with info: Analytics) {
        imageView.image = UIImage(systemName: info.systemName)
        titleLabel.text = info.title
        subtitleLabel.text = info.subtitle
    }
}

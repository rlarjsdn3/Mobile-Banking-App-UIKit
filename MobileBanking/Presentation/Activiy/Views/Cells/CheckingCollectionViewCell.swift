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

    /// 셀에 분석 정보(Analytics)를 설정합니다.
    ///
    /// - Parameter info: 셀에 표시할 `Analytics` 모델입니다.
    ///
    /// 해당 메서드는 전달받은 분석 정보의 시스템 이미지, 제목, 부제목을
    /// 셀의 이미지 뷰 및 레이블에 각각 설정합니다.
    func configure(with info: Analytics) {
        imageView.image = UIImage(systemName: info.systemName)
        titleLabel.text = info.title
        subtitleLabel.text = info.subtitle
    }
}

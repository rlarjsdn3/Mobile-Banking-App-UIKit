//
//  NibCollectionViewListCell.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

class NibCollectionVieweListCell: UICollectionViewListCell, NibLodable {

    override func awakeFromNib() {
        super.awakeFromNib()

        MainActor.assumeIsolated {
            setupAttributes()
        }
    }

    /// 서브클래스에서 UI 속성 및 스타일을 설정하기 위한 메서드입니다.
    ///
    /// 기본 구현은 비어 있으며, 필요에 따라 오버라이드하여 사용하실 수 있습니다.
    func setupAttributes() {

    }
}

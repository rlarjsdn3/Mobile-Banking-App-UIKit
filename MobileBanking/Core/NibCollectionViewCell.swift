//
//  NibCollectionViewCell.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

///
class NibCollectionViewCell: UICollectionViewCell, NibLodable {

    override func awakeFromNib() {
        super.awakeFromNib()

        MainActor.assumeIsolated {
            setupAttributes()
        }
    }

    ///
    func setupAttributes() {
    }
}

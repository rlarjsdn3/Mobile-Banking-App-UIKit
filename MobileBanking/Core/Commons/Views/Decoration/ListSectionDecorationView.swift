//
//  ListSectionDecorationView.swift
//  MobileBanking
//
//  Created by 김건우 on 7/8/25.
//

import UIKit

final class ListSectionDecorationView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAttributes()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupAttributes() {
        backgroundColor = UIColor.systemBackground
        layer.cornerRadius = 24
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.2
    }
}

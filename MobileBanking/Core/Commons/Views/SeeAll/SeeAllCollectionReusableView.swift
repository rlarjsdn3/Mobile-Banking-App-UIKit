//
//  SeeAllCollectionReusableView.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

final class SeeAllCollectionReusableView: NibCollectionReusableView {

    @IBOutlet weak var seeAllButton: UIButton!

    /// "전체 보기" 버튼 탭 이벤트를 전달할 델리게이트입니다.
    ///
    /// 해당 델리게이트를 통해 외부에서 버튼 동작에 대한 처리를 수행하실 수 있습니다.
    weak var delegate: (any SeeAllReusableViewDelegate)?

    override func setupAttributes() {
        super.setupAttributes()

        var config = UIButton.Configuration.plain()
        config.title = "See all"
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        seeAllButton.configuration = config
    }
    
    @IBAction func didTapSeeAllButton(_ sender: UIButton) {
        delegate?.seeAllReusableView(self, didSelectSeeAllButton: sender)
    }
}

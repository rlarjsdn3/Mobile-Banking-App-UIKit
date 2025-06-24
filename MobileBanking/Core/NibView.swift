//
//  NibView.swift
//  MobileBanking
//
//  Created by 김건우 on 6/25/25.
//

import UIKit

/// Nib 파일에서 로드된 UI를 코드에서 사용할 수 있도록 구성한 기본 UIView 클래스입니다.
/// - NibLodable 프로토콜을 채택하여 nib 기반 뷰 로드를 지원합니다.
/// - 서브클래싱을 통해 `setupHierachy()`와 `setupAttributes()`를 재정의하여 뷰 계층 및 속성을 설정할 수 있습니다.
class NibView: UIView, NibLodable {

    /// Interface Builder에서 디코딩될 때 호출되는 초기화 메서드입니다.
    /// 이 시점에 뷰 계층 및 속성 설정 메서드를 호출합니다.
    /// - Parameter coder: 디코딩을 위한 NSCoder 인스턴스
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHierachy()
        setupAttributes()
    }

    /// 서브뷰를 추가하고 뷰 계층을 구성합니다.
    /// 서브클래스에서 override하여 구현합니다.
    func setupHierachy() {
    }

    /// 폰트, 색상, 레이아웃 등의 속성을 설정합니다.
    /// 서브클래스에서 override하여 구현합니다.
    func setupAttributes() {
    }
}

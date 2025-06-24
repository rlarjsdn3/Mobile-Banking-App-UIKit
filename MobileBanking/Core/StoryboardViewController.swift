//
//  StoryboardViewController.swift
//  MobileBanking
//
//  Created by 김건우 on 6/25/25.
//

import UIKit

/// 스토리보드에서 인스턴스를 생성할 수 있도록 구성된 UIViewController의 기본 클래스입니다.
/// - `StoryboardInstantiable` 프로토콜을 채택하여 클래스 이름 기반 스토리보드 로드를 지원합니다.
/// - 서브클래싱을 통해 `setupHierachy()`와 `setupAttributes()`를 오버라이드하여 뷰 계층 및 속성 구성을 수행할 수 있습니다.
class StoryboardViewController: UIViewController, StoryboardInstantiable {

    /// 뷰 컨트롤러의 뷰가 메모리에 로드된 직후 호출됩니다.
    /// 뷰 계층과 속성을 설정하는 커스텀 메서드를 호출합니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierachy()
        setupAttributes()
    }

    /// 하위 뷰를 추가하고 뷰 계층을 구성합니다.
    /// 서브클래스에서 override하여 구현합니다.
    func setupHierachy() {
    }

    /// 폰트, 색상, 상태 등의 속성을 설정합니다.
    /// 서브클래스에서 override하여 구현합니다.
    func setupAttributes() {
    }
}

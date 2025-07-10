//
//  UIViewController+Extension.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

extension UIViewController {

    /// 자식 뷰 컨트롤러를 현재 뷰 컨트롤러에 추가합니다.
    ///
    /// - Parameters:
    ///   - child: 추가할 자식 뷰 컨트롤러입니다.
    ///   - container: 자식 뷰 컨트롤러의 뷰를 담을 컨테이너 뷰입니다.
    ///
    /// 이 메서드는 지정한 컨테이너 뷰에 자식 뷰 컨트롤러의 뷰를 추가하고,
    /// 부모-자식 관계를 설정합니다.
    func addChild(
        _ child: UIViewController,
        to container: UIView
    ) {
        self.addChild(child)
        container.addSubview(child.view)
        child.view.frame = container.bounds
        didMove(toParent: self)
    }

    /// 자식 뷰 컨트롤러를 현재 뷰 컨트롤러에서 제거합니다.
    ///
    /// - Parameter child: 제거할 자식 뷰 컨트롤러입니다.
    ///
    /// 자식 뷰 컨트롤러의 뷰를 슈퍼뷰에서 제거하고,
    /// 부모-자식 관계도 해제합니다.
    func removeChild(_ child: UIViewController) {
        child.willMove(toParent: self)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }

    /// 현재 뷰 컨트롤러에 추가된 모든 자식 뷰 컨트롤러를 제거합니다.
    ///
    /// 반복문을 통해 모든 자식 뷰 컨트롤러를 순차적으로 제거합니다.
    func removeAllChild() {
        self.children.forEach { child in
            removeChild(child)
        }
    }

    /// 기존 자식 뷰 컨트롤러를 새 자식 뷰 컨트롤러로 교체합니다.
    ///
    /// - Parameters:
    ///   - oldChild: 제거할 기존 자식 뷰 컨트롤러입니다. 없으면 모든 자식을 제거합니다.
    ///   - newChild: 새로 추가할 자식 뷰 컨트롤러입니다.
    ///   - container: 새 자식 뷰 컨트롤러의 뷰를 담을 컨테이너 뷰입니다.
    ///
    /// 기존 자식 뷰 컨트롤러를 제거한 후, 새로운 자식 뷰 컨트롤러를 지정된 컨테이너에 추가합니다.
    func replaceChild(
        from oldChild: UIViewController? = nil,
        to newChild: UIViewController,
        container: UIView
    ) {
        if let oldChild = oldChild { removeChild(oldChild) }
        else { removeAllChild() }
        addChild(newChild, to: container)
    }
}

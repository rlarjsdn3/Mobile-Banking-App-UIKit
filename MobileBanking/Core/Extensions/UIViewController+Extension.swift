//
//  UIViewController+Extension.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

extension UIViewController {
    
    /// <#Description#>
    /// - Parameters:
    ///   - child: <#child description#>
    ///   - container: <#container description#>
    func addChild(
        _ child: UIViewController,
        to container: UIView
    ) {
        self.addChild(child)
        container.addSubview(child.view)
        child.view.frame = container.bounds
        didMove(toParent: self)
    }
    
    /// <#Description#>
    /// - Parameter child: <#child description#>
    func removeChild(_ child: UIViewController) {
        child.willMove(toParent: self)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
    /// <#Description#>
    func removeAllChild() {
        self.children.forEach { child in
            removeChild(child)
        }
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - oldChild: <#oldChild description#>
    ///   - newChild: <#newChild description#>
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

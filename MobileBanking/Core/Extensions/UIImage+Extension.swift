//
//  UIImage+Extension.swift
//  MobileBanking
//
//  Created by 김건우 on 7/9/25.
//

import UIKit

extension UIImage {

    /// <#Description#>
    /// - Parameter newWidth: <#newWidth description#>
    /// - Returns: <#description#>
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        let targetSize = CGSize(width: newWidth, height: newHeight)
        return UIGraphicsImageRenderer(size: targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}

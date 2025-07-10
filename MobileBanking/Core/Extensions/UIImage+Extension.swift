//
//  UIImage+Extension.swift
//  MobileBanking
//
//  Created by 김건우 on 7/9/25.
//

import UIKit

extension UIImage {

    /// 지정한 너비에 맞춰 이미지를 비율에 맞게 리사이즈합니다.
    ///
    /// - Parameter newWidth: 리사이즈할 이미지의 새로운 너비입니다.
    /// - Returns: 원본 이미지의 비율을 유지한 채 리사이즈된 `UIImage` 객체입니다.
    ///
    /// 해당 메서드는 주어진 너비에 맞춰 높이도 자동으로 계산되며,
    /// 이미지의 비율을 유지한 상태로 새로운 이미지를 반환합니다.
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        let targetSize = CGSize(width: newWidth, height: newHeight)
        return UIGraphicsImageRenderer(size: targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}

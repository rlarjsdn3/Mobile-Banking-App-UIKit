//
//  NSCollectionLayoutEnvironment+Extensin.swift
//  MobileBanking
//
//  Created by 김건우 on 6/29/25.
//

import UIKit

extension NSCollectionLayoutEnvironment {

    /// 현재 가로 사이즈 클래스에 따라 적절한 레이아웃 크기를 반환합니다.
    ///
    /// - Parameters:
    ///   - compact: 가로 사이즈 클래스가 `.compact`일 때 사용할 크기입니다.
    ///   - regular: 가로 사이즈 클래스가 `.regular`일 때 사용할 크기입니다.
    /// - Returns: 사이즈 클래스에 따라 선택된 `NSCollectionLayoutDimension` 값입니다.
    func horizontalSizeClass(
        compact: @autoclosure () -> NSCollectionLayoutDimension,
        regular: @autoclosure () -> NSCollectionLayoutDimension
    ) -> NSCollectionLayoutDimension {
        if traitCollection.horizontalSizeClass == .compact {
            return compact()
        } else {
            return regular()
        }
    }

    /// 유효한 콘텐츠의 너비에 따라 디바이스 크기별로 높이 크기를 반환합니다.
    ///
    /// - Parameters:
    ///   - iphone: iPhone 크기에 해당하는 높이입니다.
    ///   - ipadPortrait: iPad 세로 모드에 해당하는 높이입니다.
    ///   - ipadLandscape: iPad 가로 모드에 해당하는 높이입니다.
    /// - Returns: 디바이스 너비에 따라 결정된 `NSCollectionLayoutDimension` 값입니다.
    func effectContentHeightSize(
        iphone: @autoclosure () -> NSCollectionLayoutDimension,
        ipadPortrait: @autoclosure () -> NSCollectionLayoutDimension,
        ipadLandscape: @autoclosure () -> NSCollectionLayoutDimension
    ) -> NSCollectionLayoutDimension {
        let width = container.effectiveContentSize.width
        switch width {
        case ...500:     return iphone()
        case 500...1050: return ipadPortrait()
        default:         return ipadLandscape()
        }
    }

    /// 현재 세로 사이즈 클래스에 따라 적절한 레이아웃 크기를 반환합니다.
    ///
    /// - Parameters:
    ///   - compact: 세로 사이즈 클래스가 `.compact`일 때 사용할 크기입니다.
    ///   - regular: 세로 사이즈 클래스가 `.regular`일 때 사용할 크기입니다.
    /// - Returns: 사이즈 클래스에 따라 선택된 `NSCollectionLayoutDimension` 값입니다.
    func verticalSizeClass(
        compact: @autoclosure () -> NSCollectionLayoutDimension,
        regular: @autoclosure () -> NSCollectionLayoutDimension
    ) -> NSCollectionLayoutDimension {
        if traitCollection.verticalSizeClass == .compact {
            return compact()
        } else {
            return regular()
        }
    }

    /// 유효한 콘텐츠의 너비에 따라 디바이스 크기별로 너비 크기를 반환합니다.
    ///
    /// - Parameters:
    ///   - iphone: iPhone 크기에 해당하는 너비입니다.
    ///   - ipadPortrait: iPad 세로 모드에 해당하는 너비입니다.
    ///   - ipadLandscape: iPad 가로 모드에 해당하는 너비입니다.
    /// - Returns: 디바이스 너비에 따라 결정된 `NSCollectionLayoutDimension` 값입니다.
    func effectContentWidthSize(
        iphone: @autoclosure () -> NSCollectionLayoutDimension,
        ipadPortrait: @autoclosure () -> NSCollectionLayoutDimension,
        ipadLandscape: @autoclosure () -> NSCollectionLayoutDimension
    ) -> NSCollectionLayoutDimension {
        let width = container.effectiveContentSize.width
        switch width {
        case ...500:     return iphone()
        case 500...1050: return ipadPortrait()
        default:         return ipadLandscape()
        }
    }
}


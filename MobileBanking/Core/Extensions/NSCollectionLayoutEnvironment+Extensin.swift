//
//  NSCollectionLayoutEnvironment+Extensin.swift
//  MobileBanking
//
//  Created by 김건우 on 6/29/25.
//

import UIKit

extension NSCollectionLayoutEnvironment {
    
    /// <#Description#>
    /// - Parameters:
    ///   - compact: <#compact description#>
    ///   - regular: <#regular description#>
    /// - Returns: <#description#>
    func horizontalSizeClass(
        compact: @autoclosure () -> NSCollectionLayoutDimension,
        regular: @autoclosure () -> NSCollectionLayoutDimension
    ) -> NSCollectionLayoutDimension {
        if traitCollection.horizontalSizeClass == .compact {
            compact()
        } else {
            regular()
        }
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - iphone: <#iphone description#>
    ///   - ipadPortrait: <#ipadPortrait description#>
    ///   - ipadLandscape: <#ipadLandscape description#>
    /// - Returns: <#description#>
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
    
    /// <#Description#>
    /// - Parameters:
    ///   - compact: <#compact description#>
    ///   - regular: <#regular description#>
    /// - Returns: <#description#>
    func verticalSizeClass(
        compact: @autoclosure () -> NSCollectionLayoutDimension,
        regular: @autoclosure () -> NSCollectionLayoutDimension
    ) -> NSCollectionLayoutDimension {
        if traitCollection.verticalSizeClass == .compact {
            compact()
        } else {
            regular()
        }
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - iphone: <#iphone description#>
    ///   - ipadPortrait: <#ipadPortrait description#>
    ///   - ipadLandscape: <#ipadLandscape description#>
    /// - Returns: <#description#>
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


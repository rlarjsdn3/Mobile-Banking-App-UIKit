//
//  CryptoContent.swift
//  MobileBanking
//
//  Created by 김건우 on 7/8/25.
//

import UIKit

enum CryptoContent {
    
    enum Section: Hashable {
        ///
        case list
    }
    
    enum Item: Hashable {
        ///
        case crypto(Crypto)
    }
}

@MainActor
extension CryptoContent.Item {
    
    func dequeueReusableCollectionView(
        collectionView: UICollectionView,
        cryptoCellRegistration: UICollectionView.CellRegistration<CryptoCollectionViewListCell, Crypto>,
        indexPath: IndexPath
    ) -> UICollectionViewCell? {
        switch self {
        case .crypto(let crypto):
            return collectionView.dequeueConfiguredReusableCell(
                using: cryptoCellRegistration,
                for: indexPath,
                item: crypto
            )
        }
    }
}

@MainActor
extension CryptoContent.Section {
    
    func buildLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch self {
        case .list: return buildCrytoListLayout(environment)
        }
    }
    
    private func buildCrytoListLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        var listConfig = UICollectionLayoutListConfiguration(appearance: .plain)
        listConfig.showsSeparators = false

        let backgroundDecorationView = NSCollectionLayoutDecorationItem.background(elementKind: ListSectionDecorationView.id)
        backgroundDecorationView.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 10, bottom: 30, trailing: 10)

        let section = NSCollectionLayoutSection.list(using: listConfig, layoutEnvironment: environment)
        section.decorationItems = [backgroundDecorationView]
        section.contentInsets = NSDirectionalEdgeInsets(top: 40, leading: 30, bottom: 40, trailing: 30)
        return section
    }
}



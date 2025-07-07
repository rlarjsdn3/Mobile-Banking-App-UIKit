//
//  SavingsContent.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

enum SavingsContent {
    
    enum Section: Hashable {
        ///
        case totalBalances
        ///
        case savings
    }
    
    enum Item: Hashable {
        ///
        case balance(Balance)
        ///
        case saving(Saving)
    }
}

@MainActor
extension SavingsContent.Item {
    
    func dequeuReusableCell(
        collectionView: UICollectionView,
        balanceCellRegistration: UICollectionView.CellRegistration<TotalBalanceCollectionViewCell, Balance>,
        savingCellRegistration: UICollectionView.CellRegistration<SavingsCollectionViewCell, Saving>,
        indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch self {
        case let .balance(balance):
            return collectionView.dequeueConfiguredReusableCell(
                using: balanceCellRegistration,
                for: indexPath,
                item: balance
            )
        case let .saving(saving):
            return collectionView.dequeueConfiguredReusableCell(
                using: savingCellRegistration,
                for: indexPath,
                item: saving
            )
        }
    }
}

@MainActor
extension SavingsContent.Section {
    
    func buildLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch self {
        case .totalBalances: return buildTotalBalancesLayout(environment)
        case .savings:       return buildSavingsLayout(environment)
        }
    }

    private func buildTotalBalancesLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupWidthDimension: NSCollectionLayoutDimension = environment.effectContentWidthSize(
            iphone: .fractionalWidth(0.955),
            ipadPortrait: .fractionalWidth(0.455),
            ipadLandscape: .fractionalWidth(0.322)
        )
        let groupSize = NSCollectionLayoutSize(
            widthDimension: groupWidthDimension,
            heightDimension: .absolute(105)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(12)

        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    // 레이아웃 다시 확인 필요
    private func buildSavingsLayout(_ environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemWidthDimension: NSCollectionLayoutDimension = environment.effectContentWidthSize(
            iphone: .fractionalWidth(0.5),
            ipadPortrait: .fractionalWidth(0.33333333),
            ipadLandscape: .fractionalWidth(0.25)
        )
        let itemSize = NSCollectionLayoutSize(
            widthDimension: itemWidthDimension,
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: itemWidthDimension
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(12)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 30, trailing: 10)
        return section
    }
 }

//
//  CheckingContent.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

enum CheckingContent {
    
    enum Section: Int, Hashable {
        ///
        case thisWeek
        ///
        case analytics
        ///
        case transactionHistories
    }
    
    enum Item: Hashable {
        ///
        case thisWeek(WeeklySpending)
        ///
        case analytics(Analytics)
        ///
        case transactionHistory(TransactionHistory)
    }
}

@MainActor
extension CheckingContent.Item {
    
    /// <#Description#>
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - thisWeekCellRegistration: <#thisWeekCellRegistration description#>
    ///   - analyticsCellRegistration: <#analyticsCellRegistration description#>
    ///   - trsansactionHistoryCellRegistration: <#trsansactionHistoryCellRegistration description#>
    ///   - indexPath: <#indexPath description#>
    /// - Returns: <#description#>
    func dequeueResulableCell(
        collectionView: UICollectionView,
        thisWeekCellRegistration: UICollectionView.CellRegistration<ThisWeekCollectionViewCell, WeeklySpending>,
        analyticsCellRegistration: UICollectionView.CellRegistration<CheckingCollectionViewCell, Analytics>,
        trsansactionHistoryCellRegistration: UICollectionView.CellRegistration<TransactionHistoryCollectionViewCell, TransactionHistory>,
        indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch self {
        case let .thisWeek(weeklySpending):
            return collectionView.dequeueConfiguredReusableCell(
                using: thisWeekCellRegistration,
                for: indexPath,
                item: weeklySpending
            )
        case let .analytics(analytics):
            return collectionView.dequeueConfiguredReusableCell(
                using: analyticsCellRegistration,
                for: indexPath,
                item: analytics
            )
        case let .transactionHistory( transactionHistory):
            return collectionView.dequeueConfiguredReusableCell(
                using: trsansactionHistoryCellRegistration,
                for: indexPath,
                item: transactionHistory
            )
        }
    }
    
    func dequeueReusableSupplementaryView(
        collectionView: UICollectionView,
        seeAllHeaderRegistration: UICollectionView.SupplementaryRegistration<SeeAllCollectionReusableView>,
        indexPath: IndexPath
    ) -> UICollectionReusableView? {
        switch self {
        case .transactionHistory(_):
            return collectionView.dequeueConfiguredReusableSupplementary(
                using: seeAllHeaderRegistration,
                for: indexPath
            )
        default:
            return nil
        }
    }
}

@MainActor
extension CheckingContent.Section {
    
    /// <#Description#>
    /// - Parameter environment: <#environment description#>
    /// - Returns: <#description#>
    func buildLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch self {
        case .thisWeek: return buildThisWeekLayout(with: environment)
        case .analytics: return buildAnalyticsLayout(with: environment)
        case .transactionHistories: return buildTransactionHistoriesLayout(with: environment)
        }
    }
    
    // 다시 레이아웃 맞추기
    private func buildThisWeekLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(200)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 8, bottom: 0, trailing: 8)
        return section
    }
    
    // 레이아웃 다시 맞추기
    private func buildAnalyticsLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.5) // 아이폰의 경우 width 1.0 - 아이패드 대응
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    private func buildTransactionHistoriesLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        var listConfig = UICollectionLayoutListConfiguration(appearance: .plain)
//        listConfig.headerMode = .supplementary
        listConfig.showsSeparators = false

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: SeeAllCollectionReusableView.id,
            alignment: .top
        )
        header.pinToVisibleBounds = true
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        header.zIndex = 999

        let section = NSCollectionLayoutSection.list(using: listConfig, layoutEnvironment: environment)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 14, bottom: 50, trailing: 14)
        section.boundarySupplementaryItems = [header]

        return section
    }
}

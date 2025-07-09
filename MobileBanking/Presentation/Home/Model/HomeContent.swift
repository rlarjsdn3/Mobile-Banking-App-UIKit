//
//  HomeContent.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

enum HomeContent {

    enum Section: Int, Hashable {
        ///
        case cards
        ///
        case expenses
        ///
        case transactionHistories
    }

    enum Item: Hashable {
        ///
        case card(Card)
        ///
        case expense(Expense)
        ///
        case transactionHistory(TransactionHistory)
    }
}

@MainActor
extension HomeContent.Item {
    
    /// <#Description#>
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - cardCellRegistration: <#cardCellRegistration description#>
    ///   - expenseCellRegistration: <#expenseCellRegistration description#>
    ///   - transactionHistoryCellRegistration: <#transactionHistoryCellRegistration description#>
    ///   - indexPath: <#indexPath description#>
    /// - Returns: <#description#>
    func dequeueReusableCell(
        collectionView: UICollectionView,
        cardCellRegistration: UICollectionView.CellRegistration<CardCollectionViewCell, Card>,
        expenseCellRegistration: UICollectionView.CellRegistration<ExpenseCollectionViewCell, Expense>,
        transactionHistoryCellRegistration: UICollectionView.CellRegistration<TransactionHistoryCollectionViewCell, TransactionHistory>,
        indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch self {
        case let .card(card):
            return collectionView.dequeueConfiguredReusableCell(
                using: cardCellRegistration,
                for: indexPath,
                item: card
            )
        case let .expense(expense):
            return collectionView.dequeueConfiguredReusableCell(
                using: expenseCellRegistration,
                for: indexPath,
                item: expense
            )
        case let .transactionHistory(transactionHistory):
            return collectionView.dequeueConfiguredReusableCell(
                using: transactionHistoryCellRegistration,
                for: indexPath,
                item: transactionHistory
            )
        }
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - seeAllHeaderRegistration: <#seeAllHeaderRegistration description#>
    ///   - indexPath: <#indexPath description#>
    /// - Returns: <#description#>
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
extension HomeContent.Section {
    
    /// <#Description#>
    /// - Parameter environment: <#environment description#>
    /// - Returns: <#description#>
    func buildLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch self {
        case .cards:                return buildCardLayout(with: environment)
        case .expenses:             return buildExpensesLayout(with: environment)
        case .transactionHistories: return buildTransactionHistoriesLayout(with: environment)
        }
    }

    private func buildCardLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupWidthDiemension = environment.effectContentWidthSize(
            iphone: .fractionalWidth(1.0),
            ipadPortrait: .fractionalWidth(0.48),
            ipadLandscape: .fractionalWidth(0.325)
        )
        let groupSize = NSCollectionLayoutSize(
            widthDimension: groupWidthDiemension,
            heightDimension: .absolute(265)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 8, bottom: 0, trailing: 8)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }

    private func buildExpensesLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupHeightDimension = environment.effectContentWidthSize(
            iphone: .fractionalWidth(0.47),
            ipadPortrait: .fractionalWidth(0.30),
            ipadLandscape: .fractionalWidth(0.225)
        )
        let groupSize = NSCollectionLayoutSize(
            widthDimension: groupHeightDimension,
            heightDimension: .absolute(190)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(8)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
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
        section.contentInsets = NSDirectionalEdgeInsets(top: -12, leading: 14, bottom: 50, trailing: 14)
        section.boundarySupplementaryItems = [header]

        return section
    }
}

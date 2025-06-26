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

    @available(*, deprecated, message: "레이아웃 다시 작성 필요")
    private func buildCardLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.33)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }

    @available(*, deprecated, message: "레이아웃 다시 작성 필요")
    private func buildExpensesLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(200)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .flexible(8)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        return section
    }

    @available(*, deprecated, message: "레이아웃 다시 작성 필요")
    private func buildTransactionHistoriesLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(100)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
        )

        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}

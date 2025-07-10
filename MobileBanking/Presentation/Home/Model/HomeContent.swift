//
//  HomeContent.swift
//  MobileBanking
//
//  Created by 김건우 on 6/26/25.
//

import UIKit

/// 홈 화면에서 사용할 섹션과 항목을 정의한 열거형입니다.
///
/// 카드, 지출, 거래 내역 등 다양한 콘텐츠 유형을 구분하여 컬렉션 뷰 구성에 활용됩니다.
enum HomeContent {

    /// 홈 화면의 섹션을 정의한 열거형입니다.
    enum Section: Int, Hashable {
        /// 카드 정보를 표시하는 섹션입니다.
        case cards
        /// 지출 정보를 표시하는 섹션입니다.
        case expenses
        /// 거래 내역을 표시하는 섹션입니다.
        case transactionHistories
    }

    /// 각 섹션에 포함될 항목을 정의한 열거형입니다.
    enum Item: Hashable {
        /// 카드 정보를 나타내는 항목입니다.
        case card(Card)
        /// 지출 정보를 나타내는 항목입니다.
        case expense(Expense)
        /// 거래 내역을 나타내는 항목입니다.
        case transactionHistory(TransactionHistory)
    }
}

@MainActor
extension HomeContent.Item {

    /// 현재 항목(self)에 해당하는 셀을 컬렉션 뷰에서 dequeue하여 반환합니다.
    ///
    /// - Parameters:
    ///   - collectionView: 셀을 dequeue할 컬렉션 뷰입니다.
    ///   - cardCellRegistration: 카드 셀 등록 정보입니다.
    ///   - expenseCellRegistration: 지출 셀 등록 정보입니다.
    ///   - transactionHistoryCellRegistration: 거래 내역 셀 등록 정보입니다.
    ///   - indexPath: 셀을 dequeue할 위치입니다.
    /// - Returns: 구성된 `UICollectionViewCell` 객체입니다.
    ///
    /// 항목 타입에 따라 적절한 셀을 dequeue하여 반환합니다.
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

    /// 거래 내역 섹션에서만 supplementary view(예: "전체 보기" 헤더)를 반환합니다.
    ///
    /// - Parameters:
    ///   - collectionView: supplementary view를 dequeue할 컬렉션 뷰입니다.
    ///   - seeAllHeaderRegistration: "전체 보기" 헤더 뷰 등록 정보입니다.
    ///   - indexPath: supplementary view를 표시할 위치입니다.
    /// - Returns: 거래 내역 섹션이면 구성된 `UICollectionReusableView`, 그렇지 않으면 `nil`을 반환합니다.
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
    
    /// 섹션 타입에 따라 적절한 컬렉션 뷰 레이아웃을 생성하여 반환합니다.
    ///
    /// - Parameter environment: 레이아웃 생성을 위한 환경 정보입니다.
    /// - Returns: 현재 섹션에 해당하는 `NSCollectionLayoutSection` 객체를 반환합니다.
    ///
    /// 각 섹션(case)에 따라 카드, 지출, 거래 내역에 맞는 전용 레이아웃 빌더를 호출합니다.
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

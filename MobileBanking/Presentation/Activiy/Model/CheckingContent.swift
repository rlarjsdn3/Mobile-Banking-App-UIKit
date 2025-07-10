//
//  CheckingContent.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

/// 입출금 탭에서 사용되는 콘텐츠 섹션과 항목을 정의하는 열거형입니다.
///
/// 주간 지출, 분석 정보, 거래 내역 등을 구분하여 컬렉션 뷰 등의 구성에 활용됩니다.
enum CheckingContent {

    /// 입출금 화면의 섹션을 정의한 열거형입니다.
    enum Section: Int, Hashable {

        /// 이번 주 지출 섹션입니다.
        case thisWeek

        /// 분석 정보(그래프 등) 섹션입니다.
        case analytics

        /// 개별 거래 내역 섹션입니다.
        case transactionHistories
    }

    /// 각 섹션에 포함될 아이템을 정의한 열거형입니다.
    enum Item: Hashable {

        /// 이번 주 지출 데이터를 나타냅니다.
        case thisWeek(WeeklySpending)

        /// 분석 정보를 나타냅니다.
        case analytics(Analytics)

        /// 개별 거래 내역을 나타냅니다.
        case transactionHistory(TransactionHistory)
    }
}

@MainActor
extension CheckingContent.Item {
    
    /// 현재 항목(self)에 해당하는 셀을 컬렉션 뷰에서 dequeue하여 반환합니다.
    ///
    /// - Parameters:
    ///   - collectionView: 셀을 dequeue할 대상 컬렉션 뷰입니다.
    ///   - thisWeekCellRegistration: `WeeklySpending` 데이터를 표시할 셀 등록 정보입니다.
    ///   - analyticsCellRegistration: `Analytics` 데이터를 표시할 셀 등록 정보입니다.
    ///   - transactionHistoryCellRegistration: `TransactionHistory` 데이터를 표시할 셀 등록 정보입니다.
    ///   - indexPath: 셀을 dequeue할 위치를 나타내는 인덱스 패스입니다.
    /// - Returns: 현재 항목에 해당하는 구성된 `UICollectionViewCell` 인스턴스를 반환합니다.
    ///
    /// 이 메서드는 `CheckingContent.Item`이 어떤 case인지에 따라 해당 셀 타입으로 적절히 dequeue하여 반환합니다.
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
    
    /// 섹션 타입에 따라 적절한 레이아웃을 생성하여 반환합니다.
    ///
    /// - Parameter environment: 컬렉션 뷰 레이아웃을 구성할 때 사용되는 환경 정보입니다.
    /// - Returns: 섹션에 맞는 `NSCollectionLayoutSection` 객체를 반환합니다.
    ///
    /// 각 섹션(thisWeek, analytics, transactionHistories)에 따라 대응되는 전용 레이아웃 빌더를 호출합니다.
    func buildLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch self {
        case .thisWeek: return buildThisWeekLayout(with: environment)
        case .analytics: return buildAnalyticsLayout(with: environment)
        case .transactionHistories: return buildTransactionHistoriesLayout(with: environment)
        }
    }

    private func buildThisWeekLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(210)
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

    private func buildAnalyticsLayout(with environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemWidthDimension: NSCollectionLayoutDimension = environment.effectContentWidthSize(
            iphone: .fractionalWidth(0.5),
            ipadPortrait: .fractionalWidth(0.5),
            ipadLandscape: .fractionalWidth(0.5)
        )
        let itemSize = NSCollectionLayoutSize(
            widthDimension: itemWidthDimension,
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupHeightDimension: NSCollectionLayoutDimension = environment.effectContentWidthSize(
            iphone: .fractionalWidth(0.5),
            ipadPortrait: .fractionalWidth(0.25),
            ipadLandscape: .fractionalHeight(0.3)
        )
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: groupHeightDimension
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
        section.contentInsets = NSDirectionalEdgeInsets(top: -12, leading: 14, bottom: 50, trailing: 14)
        section.boundarySupplementaryItems = [header]

        return section
    }
}

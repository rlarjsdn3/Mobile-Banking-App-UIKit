//
//  SavingsContent.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit
/// 적금 탭에서 사용되는 섹션 및 항목을 정의한 열거형입니다.
///
/// 전체 잔액과 개별 적금 항목을 구분하여 컬렉션 뷰에서 구성할 수 있도록 설계되어 있습니다.
enum SavingsContent {

    /// 적금 화면의 섹션을 정의한 열거형입니다.
    enum Section: Hashable {
        /// 전체 잔액을 표시하는 섹션입니다.
        case totalBalances
        /// 개별 적금 상품을 나열하는 섹션입니다.
        case savings
    }

    /// 각 섹션에 들어갈 항목을 정의한 열거형입니다.
    enum Item: Hashable {
        /// 전체 잔액 정보를 나타냅니다.
        case balance(Balance)
        /// 개별 적금 정보를 나타냅니다.
        case saving(Saving)
    }
}

@MainActor
extension SavingsContent.Item {

    /// 현재 항목(self)에 해당하는 셀을 컬렉션 뷰에서 dequeue하여 반환합니다.
    ///
    /// - Parameters:
    ///   - collectionView: 셀을 dequeue할 대상 컬렉션 뷰입니다.
    ///   - balanceCellRegistration: `Balance` 데이터를 표시할 셀 등록 정보입니다.
    ///   - savingCellRegistration: `Saving` 데이터를 표시할 셀 등록 정보입니다.
    ///   - indexPath: 셀을 dequeue할 위치를 나타내는 인덱스 패스입니다.
    /// - Returns: 구성된 `UICollectionViewCell` 객체를 반환합니다.
    ///
    /// 항목 타입이 `balance`인지 `saving`인지에 따라 해당 셀 등록 정보를 기반으로 적절한 셀을 반환합니다.
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
    
    /// 섹션 타입에 따라 적절한 컬렉션 뷰 레이아웃을 생성하여 반환합니다.
    ///
    /// - Parameter environment: 레이아웃 생성을 위한 환경 정보입니다.
    /// - Returns: 섹션에 해당하는 `NSCollectionLayoutSection` 객체를 반환합니다.
    ///
    /// `SavingsContent.Section` 값에 따라 전체 잔액 섹션 또는 적금 섹션의 레이아웃을 반환합니다.
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

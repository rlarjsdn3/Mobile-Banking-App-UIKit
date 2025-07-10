//
//  CryptoContent.swift
//  MobileBanking
//
//  Created by 김건우 on 7/8/25.
//

import UIKit

/// 가상자산 탭에서 사용되는 섹션 및 항목을 정의하는 열거형입니다.
///
/// 단일 섹션(list)과 해당 섹션에 속하는 `Crypto` 모델 기반의 항목을 포함합니다.
enum CryptoContent {

    /// 가상자산 화면의 섹션을 정의한 열거형입니다.
    enum Section: Hashable {
        /// 가상자산 리스트 섹션입니다.
        case list
    }

    /// 각 섹션에 포함될 항목을 정의한 열거형입니다.
    enum Item: Hashable {
        /// 개별 가상자산 항목입니다.
        case crypto(Crypto)
    }
}

@MainActor
extension CryptoContent.Item {

    /// 현재 항목(self)에 해당하는 셀을 컬렉션 뷰에서 dequeue하여 반환합니다.
    ///
    /// - Parameters:
    ///   - collectionView: 셀을 dequeue할 대상 컬렉션 뷰입니다.
    ///   - cryptoCellRegistration: `Crypto` 데이터를 표시할 셀 등록 정보입니다.
    ///   - indexPath: 셀을 dequeue할 위치를 나타내는 인덱스 패스입니다.
    /// - Returns: 구성된 `UICollectionViewCell` 객체를 반환합니다.
    ///
    /// 해당 메서드는 `CryptoContent.Item`이 `.crypto`인 경우,
    /// 등록된 셀 설정을 기반으로 `CryptoCollectionViewListCell`을 dequeue하여 반환합니다.
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
    
    /// 섹션 타입에 따라 해당하는 컬렉션 뷰 레이아웃을 생성하여 반환합니다.
    ///
    /// - Parameter environment: 레이아웃 생성을 위한 환경 정보입니다.
    /// - Returns: 현재 섹션에 맞는 `NSCollectionLayoutSection` 객체를 반환합니다.
    ///
    /// `CryptoContent.Section`이 `.list`인 경우, 리스트 레이아웃을 구성하는 메서드를 호출합니다.
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



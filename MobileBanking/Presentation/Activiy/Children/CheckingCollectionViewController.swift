//
//  CheckingCollectionViewController.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

final class CheckingCollectionViewController: UICollectionViewController {
    
    typealias CheckingDiffableDataSource = UICollectionViewDiffableDataSource<CheckingContent.Section, CheckingContent.Item>
    
    private var dataSource: CheckingDiffableDataSource?
    
    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttributes()
        setupCollectionViewDataSource()
        applySnapshot()
    }
    
    private func setupAttributes() {
        collectionView.setCollectionViewLayout(
            createCollectionViewLayout(),
            animated: false
        )
    }
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { sectionIndex, environment in
            guard let section = self.dataSource?.sectionIdentifier(for: sectionIndex) else { return nil }
            
            return section.buildLayout(with: environment)
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16
        return UICollectionViewCompositionalLayout(
            sectionProvider: sectionProvider,
            configuration: config
        )
    }
    
    private func setupCollectionViewDataSource() {
        let thisWeekCellRegistration = createThisWeekCellRegistration()
        let analyticsCellRegistration = createAnalyticsCellRegistration()
        let transactionHistoryCellRegistration = createTransactionHistoryCellRegistration()
        let seeAllHeaderRegistration = createSeeAllHeaderRegistration()
        
        dataSource = CheckingDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, item in
            item.dequeueResulableCell(
                collectionView: collectionView,
                thisWeekCellRegistration: thisWeekCellRegistration,
                analyticsCellRegistration: analyticsCellRegistration,
                trsansactionHistoryCellRegistration: transactionHistoryCellRegistration,
                indexPath: indexPath
            )
        }
        
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, elementKind, indexPath in
            guard let item = self?.dataSource?.itemIdentifier(for: indexPath) else {
                return nil
            }
            return item.dequeueReusableSupplementaryView(
                collectionView: collectionView,
                seeAllHeaderRegistration: seeAllHeaderRegistration,
                indexPath: indexPath
            )
        }
    }
    
    private func createThisWeekCellRegistration() -> UICollectionView.CellRegistration<ThisWeekCollectionViewCell, WeeklySpending> {
        UICollectionView.CellRegistration(cellNib: ThisWeekCollectionViewCell.nib) { cell, indexPath, thisWeek in
            cell.configure(with: thisWeek)
        }
    }
    
    private func createAnalyticsCellRegistration() -> UICollectionView.CellRegistration<CheckingCollectionViewCell, Analytics> {
        UICollectionView.CellRegistration(cellNib: CheckingCollectionViewCell.nib) { cell, indexPath, analytics in
            cell.configure(with: analytics)
        }
    }
    
    private func createTransactionHistoryCellRegistration() -> UICollectionView.CellRegistration<TransactionHistoryCollectionViewCell, TransactionHistory> {
        UICollectionView.CellRegistration(cellNib: TransactionHistoryCollectionViewCell.nib) { cell, indexPath, history in
            cell.configure(with: history)
        }
    }
    
    private func createSeeAllHeaderRegistration() -> UICollectionView.SupplementaryRegistration<SeeAllCollectionReusableView> {
        UICollectionView.SupplementaryRegistration(supplementaryNib: SeeAllCollectionReusableView.nib, elementKind: SeeAllCollectionReusableView.id) { supplementaryView, elementKind, indexPath in
            supplementaryView.delegate = self
        }
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<CheckingContent.Section, CheckingContent.Item>()
        snapshot.appendSections([.thisWeek, .analytics, .transactionHistories])
        snapshot.appendItems([.thisWeek(.mock)], toSection: .thisWeek)
        Analytics.mock.forEach { snapshot.appendItems([.analytics($0)], toSection: .analytics) }
        TransactionHistory.mock.forEach { snapshot.appendItems([.transactionHistory($0)], toSection: .transactionHistories) }
        dataSource?.apply(snapshot)
    }
}

extension CheckingCollectionViewController: SeeAllReusableViewDelegate {
    
    func seeAllReusableView(
        _ view: SeeAllCollectionReusableView,
        didSelectSeeAllButton: UIButton
    ) {
        print(#function)
    }
}

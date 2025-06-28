//
//  HomeViewController.swift
//  MobileBanking
//
//  Created by 김건우 on 6/23/25.
//

import UIKit

final class HomeViewController: StoryboardViewController {

    typealias HomeContentDiffableDataSource = UICollectionViewDiffableDataSource<HomeContent.Section, HomeContent.Item>

    private var dataSource: HomeContentDiffableDataSource?

    @IBOutlet weak var collectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()

        applySnapshot()
    }

    override func setupAttributes() {
        super.setupAttributes()
        setupCollectionViewLayout()
        setupDataSource()
    }

    private func setupCollectionViewAttr() {
        collectionView.delegate = self
    }

    private func setupCollectionViewLayout() {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { [weak self] sectionIndex, environment in
            guard let section = self?.dataSource?.sectionIdentifier(for: sectionIndex) else { return nil }
            return section.buildLayout(with: environment)
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .vertical
        config.interSectionSpacing = 12
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)

        collectionView.collectionViewLayout = layout
    }

    private func setupDataSource() {
        let cardCellRegistration = createCardCellRegistration()
        let expenseCellRegistration = createExpenseCellRegistration()
        let transactionHistoryCellRegistration = createTransactionHistoryCellRegistration()
        let seeAllHeaderRegistration = createSeeAllHeaderRegistration()

        dataSource = HomeContentDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, item in
            return item.dequeueReusableCell(
                collectionView: collectionView,
                cardCellRegistration: cardCellRegistration,
                expenseCellRegistration: expenseCellRegistration,
                transactionHistoryCellRegistration: transactionHistoryCellRegistration,
                indexPath: indexPath
            )
        }

        dataSource?.supplementaryViewProvider = { [weak self] collectionView, elementKind, indexPath in
            guard elementKind == SeeAllCollectionReusableView.id,
                  let item = self?.dataSource?.itemIdentifier(for: indexPath) else {
                return nil
            }
            return item.dequeueReusableSupplementaryView(
                collectionView: collectionView,
                seeAllHeaderRegistration: seeAllHeaderRegistration,
                indexPath: indexPath
            )
        }
    }

    private func createCardCellRegistration() -> UICollectionView.CellRegistration<CardCollectionViewCell, Card> {
        UICollectionView.CellRegistration(cellNib: CardCollectionViewCell.nib) { cell, indexPath, card in
            cell.configure(with: card)
        }
    }

    private func createExpenseCellRegistration() -> UICollectionView.CellRegistration<ExpenseCollectionViewCell, Expense> {
        UICollectionView.CellRegistration(cellNib: ExpenseCollectionViewCell.nib) { cell, indexPath, expense in
            cell.configure(with: expense)
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
        var snapshot = NSDiffableDataSourceSnapshot<HomeContent.Section, HomeContent.Item>()
        
        snapshot.appendSections([.cards, .expenses, .transactionHistories])
        Card.mock.forEach { snapshot.appendItems([.card($0)], toSection: .cards) }
        Expense.mock.forEach { snapshot.appendItems([.expense($0)], toSection: .expenses) }
        TransactionHistory.mock.forEach { snapshot.appendItems([.transactionHistory($0)], toSection: .transactionHistories) }
        dataSource?.apply(snapshot)
    }
}


// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {

}



// MARK: - SeeAllReusasbleViewDelegate

extension HomeViewController: SeeAllReusableViewDelegate {
    
    func seeAllReusableView(
        _ view: SeeAllCollectionReusableView,
        didSelectSeeAllButton: UIButton
    ) {
        print(#function)
    }
}

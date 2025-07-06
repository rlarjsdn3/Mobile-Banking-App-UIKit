//
//  SavingsCollectionViewController.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

final class SavingsCollectionViewController: UICollectionViewController {
    
    typealias SavingsDiffableDataSource = UICollectionViewDiffableDataSource<SavingsContent.Section, SavingsContent.Item>
    
    private var dataSource: SavingsDiffableDataSource?
    
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
    
    private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { [weak self] sectionIndex, environment in
            guard let section = self?.dataSource?.sectionIdentifier(for: sectionIndex) else { return nil }
            return section.buildLayout(environment)
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
    }
    
    private func setupCollectionViewDataSource() {
        let balanceCellRegistraion = createBalanceCellRegistration()
        let savingCellRegistration = createSavingCellRegistration()
        
        dataSource = SavingsDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, item in
            item.dequeuReusableCell(
                collectionView: collectionView,
                balanceCellRegistration: balanceCellRegistraion,
                savingCellRegistration: savingCellRegistration,
                indexPath: indexPath
            )
        }
    }
    
    private func createBalanceCellRegistration() -> UICollectionView.CellRegistration<TotalBalanceCollectionViewCell, Balance> {
        UICollectionView.CellRegistration(cellNib: TotalBalanceCollectionViewCell.nib) { cell, indexPath, balance in
            cell.configure(with: balance)
        }
    }
    
    private func createSavingCellRegistration() -> UICollectionView.CellRegistration<SavingsCollectionViewCell, Saving> {
        UICollectionView.CellRegistration(cellNib: SavingsCollectionViewCell.nib) { cell, indexPath, saving in
            cell.configure(with: saving)
        }
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SavingsContent.Section, SavingsContent.Item>()
        snapshot.appendSections([.totalBalances, .savings])
        Balance.mock.forEach { snapshot.appendItems([.balance($0)], toSection: .totalBalances) }
        Saving.mock.forEach { snapshot.appendItems([.saving($0)], toSection: .savings) }
        dataSource?.apply(snapshot)
    }
    
}

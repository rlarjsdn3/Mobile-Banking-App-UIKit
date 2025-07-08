//
//  CryptoCollectionViewController.swift
//  MobileBanking
//
//  Created by 김건우 on 7/6/25.
//

import UIKit

final class CryptoCollectionViewController: UICollectionViewController {
    
    typealias CryptoDiffableDataSource = UICollectionViewDiffableDataSource<CryptoContent.Section, CryptoContent.Item>
    
    private var dataSource: CryptoDiffableDataSource?
    
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
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.setCollectionViewLayout(
            createCollectionViewLayout(),
            animated: false
        )
    }
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { [weak self] sectionIndex, environment in
            guard let section = self?.dataSource?.sectionIdentifier(for: sectionIndex) else { return nil }
            return section.buildLayout(environment)
        }
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
        layout.register(
            ListSectionDecorationView.self,
            forDecorationViewOfKind: ListSectionDecorationView.id
        )
        return layout
    }
    
    private func setupCollectionViewDataSource() {
        let cryptoCelRegistration = createCryptoCellRegistration()

        dataSource = CryptoDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, item in
            item.dequeueReusableCollectionView(
                collectionView: collectionView,
                cryptoCellRegistration: cryptoCelRegistration,
                indexPath: indexPath
            )
        }
    }
    
    private func createCryptoCellRegistration() -> UICollectionView.CellRegistration<CryptoCollectionViewListCell, Crypto> {
        UICollectionView.CellRegistration(cellNib: CryptoCollectionViewListCell.nib) { cell, indexPath, crypto in
            guard let section = self.dataSource?.sectionIdentifier(for: indexPath.section),
                  let numberOfItems = self.dataSource?.snapshot(for: section).items.count else {
                return
            }
            let isLast = indexPath.item + 1 == numberOfItems
            cell.seperatorView.isHidden = isLast
            cell.configure(with: crypto)
        }
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<CryptoContent.Section, CryptoContent.Item>()
        snapshot.appendSections([.list])
        Crypto.mock.forEach { snapshot.appendItems([.crypto($0)], toSection: .list) }
        dataSource?.apply(snapshot, animatingDifferences: false)
    }
}

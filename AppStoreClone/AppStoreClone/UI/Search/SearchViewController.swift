//
//  SearchViewController.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/28.
//

import UIKit

enum SearchSection: Int {
    case newDiscovery
    case recommendItem

    func createSection() -> NSCollectionLayoutSection {
        switch self {
        case .newDiscovery
        case .recommendItem
        }
    }
}

final class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setUI()
    }

    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
        // 내비게이션 바는 항상 표출되도록 설정
        searchController.hidesNavigationBarDuringPresentation = false
        /// updateSearchResults(for:) 델리게이트를 사용을 위한 델리게이트 할당
//        searchController.delegate = self
//        searchController.searchBar.delegate = self
        /// 뒷배경이 흐려지지 않도록 설정
        searchController.obscuresBackgroundDuringPresentation = true

        return searchController
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    private lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewLayout()

        return layout
    }()

    private lazy var collectionViewCompositionalLayout = createCompositionalLayout()

    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            guard let section = SearchSection(rawValue: sectionIndex) else {
                return nil
            }

            switch section {
            case .newDiscovery:
                let itemWidth = (UIScreen.main.bounds.width / 2) - 30

                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)

                let section = NSCollectionLayoutSection(group: group)

                return section
            case .recommendItem:

                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(70))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)

                return section
            }
        }

        return layout
    }

    private func setNavigationBar() {
        navigationController?.navigationBar.topItem?.title = "검색"
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    private func setUI() {
        view.backgroundColor = .color(light: .backgroundColorLight, dark: .backgroundColorDark)

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

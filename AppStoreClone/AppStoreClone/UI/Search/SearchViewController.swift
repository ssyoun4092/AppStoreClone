//
//  SearchViewController.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/28.
//

import UIKit
import Combine

final class SearchViewController: UIViewController {

    typealias DataSource = UICollectionViewDiffableDataSource<SearchSection, AnyHashable>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SearchSection, AnyHashable>

    private var cancellables: Set<AnyCancellable> = .init()
    private lazy var dataSource: DataSource = createDataSource()
    private let apiManager = APIManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setUI()
        applySnapshot()
    }

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
        // 내비게이션 바는 항상 표출되도록 설정
        searchController.hidesNavigationBarDuringPresentation = false
        /// updateSearchResults(for:) 델리게이트를 사용을 위한 델리게이트 할당
//        searchController.delegate = self
        searchController.searchBar.delegate = self
        /// 뒷배경이 흐려지지 않도록 설정
        searchController.obscuresBackgroundDuringPresentation = true

        return searchController
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewCompositionalLayout)
        collectionView.register(NewDiscoveryCell.self, forCellWithReuseIdentifier: "NewDiscoveryCell")
        collectionView.register(RecommendItemCell.self, forCellWithReuseIdentifier: "RecommendItemCell")
        collectionView.register(SearchSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchSectionHeaderView")
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    private lazy var collectionViewCompositionalLayout = createCompositionalLayout()

    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            guard let searchSection = SearchSection(rawValue: sectionIndex) else {
                return nil
            }

            switch searchSection {
            case .newDiscovery:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)

                let section = NSCollectionLayoutSection(group: group)

                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                section.boundarySupplementaryItems = [header]

                return section
            case .recommendItem:

                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(70))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)

                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                section.boundarySupplementaryItems = [header]

                return section
            }
        }

        return layout
    }

    fileprivate func createDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, item in
            guard let searchSection = SearchSection(rawValue: indexPath.section) else {
                return UICollectionViewCell()
            }

            switch searchSection {
            case .newDiscovery:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewDiscoveryCell", for: indexPath) as? NewDiscoveryCell else {
                    return UICollectionViewCell()
                }
                // cell.configure(with: item.newDis)
                guard let newDiscoveryItem = item as? SearchNewDiscoveryModel else {
                    return UICollectionViewCell()
                }

                cell.configure(with: newDiscoveryItem)

                return cell

            case .recommendItem:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendItemCell", for: indexPath) as? RecommendItemCell else {
                    return UICollectionViewCell()
                }

                guard let recommendItem = item as? SearchRecommendModel else {
                    return UICollectionViewCell()
                }

                cell.configure(with: recommendItem)

                return cell
            }
        }

        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader,
                  let section = SearchSection(rawValue: indexPath.section) else {
                return nil
            }

            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SearchSectionHeaderView", for: indexPath) as? SearchSectionHeaderView else {
                return nil
            }
            view.configure(with: section.title)

            return view
        }

        return dataSource
    }

    fileprivate func applySnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections(SearchSection.allCases)
        snapshot.appendItems(SearchNewDiscoveryModel.mock, toSection: .newDiscovery)
        snapshot.appendItems(SearchRecommendModel.mock, toSection: .recommendItem)

        dataSource.apply(snapshot)
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

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }

        apiManager.getAppStore(text)
            .sink { complete in
                switch complete {
                case .finished:
                    return
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { data in
                print("data: \(data)")
            }.store(in: &cancellables)
    }
}

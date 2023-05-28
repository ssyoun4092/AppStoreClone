//
//  SearchViewController.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/28.
//

import UIKit

final class SearchViewController: UIViewController {
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "게임, 앱, 스토리 등"
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    private func setUI() {
        [searchBar].forEach {
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            searchBar.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

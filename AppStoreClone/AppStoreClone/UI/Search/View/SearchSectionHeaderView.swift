//
//  SearchSectionHeaderView.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/29.
//

import UIKit

final class SearchSectionHeaderView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private func setUI() {
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func configure(with title: String) {
        titleLabel.text = title
    }
}

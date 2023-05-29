//
//  RecommendItemCell.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/29.
//

import UIKit

final class RecommendItemCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let downloadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.color(light: .lightGray, dark: .darkGray)
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.cornerRadius = 13
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let inAppPurchaseLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font = .systemFont(ofSize: 9, weight: .medium)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private func setUI() {
        [imageView, titleLabel, descriptionLabel, downloadButton, inAppPurchaseLabel].forEach {
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -2),
            titleLabel.trailingAnchor.constraint(equalTo: downloadButton.leadingAnchor, constant: -20),

            descriptionLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: downloadButton.leadingAnchor, constant: -20),

            downloadButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 65),
            downloadButton.heightAnchor.constraint(equalToConstant: 26),
            downloadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),

            inAppPurchaseLabel.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: 5),
            inAppPurchaseLabel.centerXAnchor.constraint(equalTo: downloadButton.centerXAnchor)
        ])
    }

    func configure(with model: SearchRecommendModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        inAppPurchaseLabel.isHidden = model.hasInAppPurchase ? false : true
    }
}
